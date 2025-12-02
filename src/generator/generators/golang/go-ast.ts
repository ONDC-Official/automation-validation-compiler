import {
	AstNode,
	BinaryOperatorNode,
	CustomBinaryFunction,
	CustomUniaryFunction,
	NotOperatorNode,
	ReturnStatementNode,
} from "../../../services/return-complier/ast.js";
import { buildAstFromInput } from "../../../services/return-complier/combined.js";
import {
	AllIn,
	AnyIn,
	AreUnique,
	EqualTo,
	FollowRegex,
	GreaterThan,
	LessThan,
	NoneIn,
	ArePresent,
} from "../../../services/return-complier/tokens.js";

const uniaryFunction = {
	[AreUnique.LABEL ?? "are unique"]: "AreUnique",
	[ArePresent.LABEL ?? "are present"]: "ArePresent",
};

const binaryFunction = {
	[AllIn.LABEL ?? "all in"]: "AllIn",
	[AnyIn.LABEL ?? "any in"]: "AnyIn",
	[FollowRegex.LABEL ?? "follow regex"]: "FollowRegex",
	[NoneIn.LABEL ?? "none in"]: "NoneIn",
	[EqualTo.LABEL ?? "equal to"]: "EqualTo",
	[GreaterThan.LABEL ?? "greater than"]: "GreaterThan",
	[LessThan.LABEL ?? "less than"]: "LessThan",
};

function getGoOperator(op: string): string {
	switch (op) {
		case "&&":
			return "&&";
		case "||":
			return "||";
		default:
			return op;
	}
}

function compileToGo(node: AstNode): string {
	if (node.type === "returnStatement") {
		const returnNode = node as ReturnStatementNode;
		return compileToGo(returnNode.expression);
	}
	if (node.type === "binaryOperator") {
		const binaryNode = node as BinaryOperatorNode;
		const lhs = compileToGo(binaryNode.lhs);
		const rhs = compileToGo(binaryNode.rhs);
		return `(${lhs}) ${getGoOperator(binaryNode.operator)} (${rhs})`;
	}
	if (node.type === "notOperator") {
		const notNode = node as NotOperatorNode;
		const expression = compileToGo(notNode.expression);
		return `!(${expression})`;
	}
	if (node.type === "customUniaryFunction") {
		const unary = node as CustomUniaryFunction;
		const func = uniaryFunction[unary.customFunction];
		const varName = unary.expression.name;
		return `utils.${func}(${varName})`;
	}
	if (node.type === "customBinaryFunction") {
		const binary = node as CustomBinaryFunction;
		const func = binaryFunction[binary.customFunction];
		const lhs = binary.lhs.name;
		const rhs = binary.rhs.name;
		return `utils.${func}(${lhs}, ${rhs})`;
	}
	throw new Error("Unknown node type");
}

export const compileInputToGo = (input: string) => {
	const ast = buildAstFromInput(input);
	return compileToGo(ast);
};
