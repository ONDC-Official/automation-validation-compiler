import {
	AstNode,
	BinaryOperatorNode,
	CustomBinaryFunction,
	CustomUniaryFunction,
	IdentifierNode,
	NotOperatorNode,
	ReturnStatementNode,
} from "../../../services/return-complier/ast.js";
import { buildAstFromInput } from "../../../services/return-complier/combined.js";
import {
	AllIn,
	AnyIn,
	ArePresent,
	AreUnique,
	EqualTo,
	FollowRegex,
	GreaterThan,
	LessThan,
	NoneIn,
} from "../../../services/return-complier/tokens.js";

type UnaryBuilder = (operand: string) => string;
type BinaryBuilder = (lhs: string, rhs: string) => string;

const unaryFunctionBuilders: Record<string, UnaryBuilder> = {
	[AreUnique.LABEL ?? "are unique"]: (operand: string) =>
		`cardinality(array_distinct(${operand})) = cardinality(${operand})`,
	[ArePresent.LABEL ?? "are present"]: (operand: string) =>
		`cardinality(${operand}) > 0 AND all_match(${operand}, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))`,
};

const binaryFunctionBuilders: Record<string, BinaryBuilder> = {
	[AllIn.LABEL ?? "all in"]: (lhs: string, rhs: string) =>
		`all_match(${lhs}, value -> contains(${rhs}, value))`,
	[AnyIn.LABEL ?? "any in"]: (lhs: string, rhs: string) =>
		`any_match(${lhs}, value -> contains(${rhs}, value))`,
	[NoneIn.LABEL ?? "none in"]: (lhs: string, rhs: string) =>
		`none_match(${lhs}, value -> contains(${rhs}, value))`,
	[EqualTo.LABEL ?? "equal to"]: (lhs: string, rhs: string) => `(${lhs} = ${rhs})`,
	[FollowRegex.LABEL ?? "follow regex"]: (lhs: string, rhs: string) =>
		`all_match(${rhs}, pattern -> all_match(${lhs}, value -> regexp_like(value, pattern)))`,
	[GreaterThan.LABEL ?? "greater than"]: (lhs: string, rhs: string) =>
		buildNumericOrDateComparison(lhs, rhs, ">"),
	[LessThan.LABEL ?? "less than"]: (lhs: string, rhs: string) =>
		buildNumericOrDateComparison(lhs, rhs, "<"),
};

function buildNumericOrDateComparison(
	lhs: string,
	rhs: string,
	operator: ">" | "<"
): string {
	const comparison = operator === ">" ? ">" : "<";
	const leftTimestamp = (index: string) =>
		`try(from_iso8601_timestamp(${lhs}[${index}]))`;
	const rightTimestamp = (index: string) =>
		`try(from_iso8601_timestamp(${rhs}[${index}]))`;
	const leftNumber = (index: string) => `try_cast(${lhs}[${index}] AS double)`;
	const rightNumber = (index: string) => `try_cast(${rhs}[${index}] AS double)`;

	return `all_match(
    sequence(1, cardinality(${lhs})),
    idx ->
        CASE
            WHEN idx > cardinality(${rhs}) THEN TRUE
            ELSE
                CASE
                    WHEN ${leftTimestamp("idx")} IS NOT NULL AND ${rightTimestamp(
		"idx"
	)} IS NOT NULL THEN ${leftTimestamp("idx")} ${comparison} ${rightTimestamp("idx")}
                    WHEN ${leftNumber("idx")} IS NOT NULL AND ${rightNumber(
		"idx"
	)} IS NOT NULL THEN ${leftNumber("idx")} ${comparison} ${rightNumber("idx")}
                    ELSE FALSE
                END
        END
)`;
}

function compileToSql(
	node: AstNode,
	variableLookup: Record<string, string>
): string {
	switch (node.type) {
		case "returnStatement": {
			const returnNode = node as ReturnStatementNode;
			return compileToSql(returnNode.expression, variableLookup);
		}
		case "binaryOperator": {
			const binaryNode = node as BinaryOperatorNode;
			const lhs = compileToSql(binaryNode.lhs, variableLookup);
			const rhs = compileToSql(binaryNode.rhs, variableLookup);
			const operator = binaryNode.operator === "&&" ? "AND" : "OR";
			return `(${lhs}) ${operator} (${rhs})`;
		}
		case "notOperator": {
			const notNode = node as NotOperatorNode;
			const expression = compileToSql(notNode.expression, variableLookup);
			return `NOT (${expression})`;
		}
		case "customUniaryFunction": {
			const unaryNode = node as CustomUniaryFunction;
			const builder = unaryFunctionBuilders[unaryNode.customFunction];
			if (!builder) {
				throw new Error(
					`Unsupported unary function: ${unaryNode.customFunction}`
				);
			}
			const identifier = unaryNode.expression.name;
			const value = variableLookup[identifier];
			if (!value) {
				throw new Error(`Unknown variable referenced: ${identifier}`);
			}
			return builder(value);
		}
		case "customBinaryFunction": {
			const binaryNode = node as CustomBinaryFunction;
			const builder = binaryFunctionBuilders[binaryNode.customFunction];
			if (!builder) {
				throw new Error(
					`Unsupported binary function: ${binaryNode.customFunction}`
				);
			}
			const lhs = variableLookup[binaryNode.lhs.name];
			const rhs = variableLookup[binaryNode.rhs.name];
			if (!lhs) {
				throw new Error(`Unknown variable referenced: ${binaryNode.lhs.name}`);
			}
			if (!rhs) {
				throw new Error(`Unknown variable referenced: ${binaryNode.rhs.name}`);
			}
			return builder(lhs, rhs);
		}
		case "identifier": {
			const identifier = node as IdentifierNode;
			const value = variableLookup[identifier.name];
			if (!value) {
				throw new Error(`Unknown variable referenced: ${identifier.name}`);
			}
			return value;
		}
		default:
			throw new Error(`Unsupported AST node type: ${node.type}`);
	}
}

export const compileInputToSql = (
	input: string,
	variableLookup: Record<string, string>
) => {
	const ast = buildAstFromInput(input);
	return compileToSql(ast, variableLookup);
};
