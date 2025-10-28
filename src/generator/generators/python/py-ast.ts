import {
	AstNode,
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

function getPyOperator(op: string): string {
	switch (op) {
		case "&&":
			return "and";
		case "||":
			return "or";
		case "==":
			return "==";
		case "!=":
			return "!=";
		case ">":
			return ">";
		case "<":
			return "<";
		case ">=":
			return ">=";
		case "<=":
			return "<=";
		default:
			throw new Error(`Unsupported operator: ${op}`);
	}
}
const uniaryFunction = {
	[AreUnique.LABEL ?? "are unique"]: "are_unique",
	[ArePresent.LABEL ?? "are present"]: "are_present",
};

const binaryFunction = {
	[AllIn.LABEL ?? "all in"]: "all_in",
	[AnyIn.LABEL ?? "any in"]: "any_in",
	[FollowRegex.LABEL ?? "follow regex"]: "follow_regex",
	[NoneIn.LABEL ?? "none in"]: "none_in",
	[EqualTo.LABEL ?? "equal to"]: "equal_to",
	[GreaterThan.LABEL ?? "greater than"]: "greater_than",
	[LessThan.LABEL ?? "less than"]: "less_than",
};

function compileToPy(node: AstNode): string {
	if (node.type === "returnStatement") {
		const returnNode = node as ReturnStatementNode;
		return compileToPy(returnNode.expression);
	}
	if (node.type === "binaryOperator") {
		const binaryNode = node as any;
		const lhs = compileToPy(binaryNode.lhs);
		const rhs = compileToPy(binaryNode.rhs);
		return `(${lhs}) ${getPyOperator(binaryNode.operator)} (${rhs})`;
	}
	if (node.type === "notOperator") {
		const notNode = node as any;
		const expression = compileToPy(notNode.expression);
		return `not (${expression})`;
	}
	if (node.type === "customUniaryFunction") {
		const unary = node as any;
		const func = uniaryFunction[unary.customFunction];
		const varName = unary.expression.name;
		return `validation_utils["${func}"](${varName})`;
	}
	if (node.type === "customBinaryFunction") {
		const binary = node as any;
		const func = binaryFunction[binary.customFunction];
		const lhs = binary.lhs.name;
		const rhs = binary.rhs.name;
		return `validation_utils["${func}"](${lhs}, ${rhs})`;
	}
	throw new Error("Unknown node type");
}

export const compileInputToPy = (input: string) => {
	const ast = buildAstFromInput(input);
	return compileToPy(ast);
};
