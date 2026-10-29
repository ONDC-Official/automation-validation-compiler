import { JSONSchema7 } from "json-schema";
import { BUILD_TYPE } from "../types/build.js";
import { removeRequiredAndEnum } from "../utils/config-utils/json-schema-utils.js";
import { getAllJsonPaths } from "../utils/json-path-utils/extract-string-paths.js";

// FD route table entry (build.yaml `x-fd-routes`, written by @ondc/build-tools parse). Only the
// fields this service reads; the full format is FD-ROUTE-TABLE.md.
type FdRoute = {
	action: string;
	method: "GET" | "POST";
	path: string;
	hasBody: boolean;
};

type FdParameter = {
	name: string;
	in: string;
	required?: boolean;
	schema?: JSONSchema7;
};

export class ExtractionService {
	extractSchemas = async (
		data: BUILD_TYPE,
		removeRequired: boolean,
		removeEnums: boolean,
	) => {
		// FD (ONDC:FIS14:FD) addresses REST resources, so its schemas are keyed by the route
		// table's actions instead of the first path segment. Beckn builds take the path below.
		const fdRoutes = (data as any)["x-fd-routes"]?.routes as FdRoute[] | undefined;
		if (fdRoutes) return this.extractFdSchemas(data, fdRoutes);

		const paths = data.paths;
		const apis = Object.keys(paths).map((key) => {
			return key.split("/")[1];
		});
		const output: any = { paths: {} };
		for (const targetApi of apis) {
			const existingSchema =
				paths[`/${targetApi}`].post.requestBody.content["application/json"]
					.schema;
			const filtteredSchema = removeRequiredAndEnum(
				existingSchema,
				removeEnums,
				removeRequired,
			);
			output[targetApi] = filtteredSchema;
		}
		return output as Record<string, JSONSchema7>;
	};

	extractPossiblePaths = (schemas: Record<string, JSONSchema7>) => {
		const paths: Record<string, string[]> = {};
		for (const [key, schema] of Object.entries(schemas)) {
			paths[key] = getAllJsonPaths(schema).map((p) =>
				p
					.replace(
						/\.([\w-]+\/[\w-]+)(?![\w\]])/g,
						(_, match) => `['${match}']`,
					)
					.replace(
						/\.(@[\w-\/]+)/g,
						(_, match) => `['@${match.substring(1)}']`,
					),
			);
		}
		return paths;
	};

	/**
	 * One schema per FD action, keyed by the action name:
	 * - an operation with a body uses its request-body schema;
	 * - a GET read has no body, so it gets a schema for the body the workbench builds for it
	 *   internally: `{ context, message: { pathParams, query } }`.
	 * FD schemas keep `required` and `enum`: a certification run must reject a missing field
	 * or an unsupported value.
	 */
	extractFdSchemas = (data: BUILD_TYPE, routes: FdRoute[]) => {
		const paths = data.paths as Record<string, Record<string, any>>;
		const context = (data as any).components?.schemas?.Context as JSONSchema7 | undefined;
		const output: Record<string, JSONSchema7> = {};

		for (const route of routes) {
			const pathItem = paths[route.path];
			const op = pathItem?.[route.method.toLowerCase()];
			if (!op) {
				throw new Error(`x-fd-routes: ${route.method} ${route.path} (${route.action}) is not in paths`);
			}
			if (route.hasBody) {
				const schema = op.requestBody?.content?.["application/json"]?.schema;
				if (!schema) {
					throw new Error(`${route.action}: request body has no application/json schema`);
				}
				output[route.action] = schema as JSONSchema7;
				continue;
			}
			const parameters: FdParameter[] = [...(pathItem.parameters ?? []), ...(op.parameters ?? [])];
			output[route.action] = {
				type: "object",
				required: ["context", "message"],
				properties: {
					context: context ?? { type: "object" },
					message: {
						type: "object",
						required: ["pathParams"],
						properties: {
							pathParams: this.parameterObject(parameters, "path"),
							query: this.parameterObject(parameters, "query"),
						},
					},
				},
			};
		}
		return output;
	};

	private parameterObject = (parameters: FdParameter[], location: string): JSONSchema7 => {
		const selected = parameters.filter((p) => p?.in === location);
		return {
			type: "object",
			properties: Object.fromEntries(selected.map((p) => [p.name, p.schema ?? { type: "string" }])),
			required: selected.filter((p) => p.required || location === "path").map((p) => p.name),
		};
	};

	extractPayloadExamples = (data: BUILD_TYPE) => {};
}
