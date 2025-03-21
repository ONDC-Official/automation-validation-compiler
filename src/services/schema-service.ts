import { JSONSchema7 } from "json-schema";
import { BUID_TYPE } from "../types/build.js";
import { removeRequiredAndEnum } from "../utils/config-utils/json-schema-utils.js";
import { getAllJsonPaths } from "../utils/json-path-utils/extract-string-paths.js";

export class SchemaExtactionService {
	extractSchemas = async (
		data: BUID_TYPE,
		removeRequired: boolean,
		removeEnums: boolean
	) => {
		const paths = data.paths;
		const apis = Object.keys(paths).map((key) => {
			return key.split("/")[1];
		});
		const output: any = { paths: {} };
		for (const targetApi of apis) {
			const existingSchema =
				paths[`/${targetApi}`].post.requestBody.content["application/json"]
					.schema;
			// output["response"] = paths[`/${targetApi}`].post.responses.default.content["application/json"].schema;
			const filtteredSchema = removeRequiredAndEnum(
				existingSchema,
				removeEnums,
				removeRequired
			);
			output[targetApi] = filtteredSchema;
		}
		return output as Record<string, JSONSchema7>;
	};

	extractPossiblePaths = (schemas: Record<string, JSONSchema7>) => {
		const paths: Record<string, string[]> = {};
		for (const [key, schema] of Object.entries(schemas)) {
			paths[key] = getAllJsonPaths(schema);
		}
		return paths;
	};
}
