import payloadUtils from "../utils/json-path-utils";
import validations from "../utils/validation-utils";
import {
    testFunctionArray,
    validationInput,
    validationOutput,
} from "../types/test-config";

export default function search(input: validationInput): validationOutput {
    const scope = payloadUtils.getJsonPath(input.payload, "$");
    let subResults: validationOutput = [];
    let valid = true;
    for (const testObj of scope) {
        testObj._EXTERNAL = input.externalData;

        function REQUIRED_CONTEXT_CODE_1(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.location.country.code",
                );
                const enumList = ["IND"];

                const validate =
                    !validations.arePresent(attr) &&
                    validations.allIn(attr, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `Country code must be present and valid`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_CONTEXT_DOMAIN_3(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.domain",
                );
                const enumList = ["ONDC:TRV10"];

                const validate =
                    validations.arePresent(attr) &&
                    validations.allIn(attr, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_DOMAIN_3**: all of the following sub conditions must be met:

  - **condition REQUIRED_CONTEXT_DOMAIN_3.1**: $.context.domain must be present in the payload
  - **condition REQUIRED_CONTEXT_DOMAIN_3.2**: every element of $.context.domain must be in ["ONDC:TRV10"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_CONTEXT_TIMESTAMP_4(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.timestamp",
                );

                const validate = validations.arePresent(attr);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_TIMESTAMP_4**: $.context.timestamp must be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_CONTEXT_BAP_ID_5(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.bap_id",
                );

                const validate = validations.arePresent(attr);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_BAP_ID_5**: $.context.bap_id must be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_CONTEXT_TRANSACTION_ID_6(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.transaction_id",
                );

                const validate = validations.arePresent(attr);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_TRANSACTION_ID_6**: $.context.transaction_id must be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_CONTEXT_MESSAGE_ID_7(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.message_id",
                );

                const validate = validations.arePresent(attr);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_MESSAGE_ID_7**: $.context.message_id must be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_CONTEXT_VERSION_8(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.version",
                );

                const validate = validations.arePresent(attr);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_VERSION_8**: $.context.version must be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_CONTEXT_ACTION_9(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.action",
                );
                const enumList = ["search"];

                const validate =
                    validations.arePresent(attr) &&
                    validations.allIn(attr, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:

  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["search"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_CONTEXT_BAP_URI_10(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.bap_uri",
                );

                const validate = validations.arePresent(attr);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_BAP_URI_10**: $.context.bap_uri must be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_CONTEXT_TTL_11(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(testObj, "$.context.ttl");

                const validate = validations.arePresent(attr);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_TTL_11**: $.context.ttl must be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_MESSAGE_TYPE_12(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.fulfillment.stops[*].type",
                );
                const enumList = ["START", "END", "INTERMEDIATE_STOP"];

                const validate =
                    validations.arePresent(attr) &&
                    validations.allIn(attr, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_MESSAGE_TYPE_12**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_TYPE_12.1**: $.message.intent.fulfillment.stops[*].type must be present in the payload
  - **condition REQUIRED_MESSAGE_TYPE_12.2**: every element of $.message.intent.fulfillment.stops[*].type must be in ["START", "END", "INTERMEDIATE_STOP"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_MESSAGE_COLLECTED_BY_14(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.payment.collected_by",
                );
                const enumList = ["BPP", "BAP"];

                const validate =
                    validations.arePresent(attr) &&
                    validations.allIn(attr, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_MESSAGE_COLLECTED_BY_14**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_COLLECTED_BY_14.1**: $.message.intent.payment.collected_by must be present in the payload
  - **condition REQUIRED_MESSAGE_COLLECTED_BY_14.2**: every element of $.message.intent.payment.collected_by must be in ["BPP", "BAP"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function VALID_ENUM_MESSAGE_CODE_1(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const enumList = [
                    "ON_DEMAND_TRIP",
                    "ON_DEMAND_RENTAL",
                    "SCHEDULED_TRIP",
                    "SCHEDULED_RENTAL",
                ];
                const enumPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.category.descriptor.code",
                );

                const skipCheck = !validations.arePresent(enumPath);
                if (skipCheck) continue;

                const validate = validations.allIn(enumPath, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition VALID_ENUM_MESSAGE_CODE_1**: every element of $.message.intent.category.descriptor.code must be in ["ON_DEMAND_TRIP", "ON_DEMAND_RENTAL", "SCHEDULED_TRIP", "SCHEDULED_RENTAL"]

	> Note: **Condition VALID_ENUM_MESSAGE_CODE_1** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.category.descriptor.code must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function VALID_ENUM_MESSAGE_CATEGORY_2(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const enumList = ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"];
                const enumPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.fulfillment.vehicle.category",
                );

                const skipCheck = !validations.arePresent(enumPath);
                if (skipCheck) continue;

                const validate = validations.allIn(enumPath, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition VALID_ENUM_MESSAGE_CATEGORY_2**: every element of $.message.intent.fulfillment.vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]

	> Note: **Condition VALID_ENUM_MESSAGE_CATEGORY_2** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.fulfillment.vehicle.category must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function VALID_ENUM_MESSAGE_VARIANT_3(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const enumList = [
                    "SEDAN",
                    "SUV",
                    "HATCHBACK",
                    "TWO_WHEELER",
                    "AUTO_RICKSHAW",
                ];
                const enumPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.fulfillment.vehicle.variant",
                );

                const skipCheck = !validations.arePresent(enumPath);
                if (skipCheck) continue;

                const validate = validations.allIn(enumPath, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition VALID_ENUM_MESSAGE_VARIANT_3**: every element of $.message.intent.fulfillment.vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]

	> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_3** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.fulfillment.vehicle.variant must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function VALID_ENUM_MESSAGE_ENERGY_TYPE_4(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const enumList = [
                    "ELECTRIC",
                    "PETRO",
                    "DIESEL",
                    "HYDROGEN",
                    "BIOFUELS",
                    "CNG",
                    "LPG",
                ];
                const enumPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.fulfillment.vehicle.energy_type",
                );

                const skipCheck = !validations.arePresent(enumPath);
                if (skipCheck) continue;

                const validate = validations.allIn(enumPath, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_4**: every element of $.message.intent.fulfillment.vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]

	> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_4** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.fulfillment.vehicle.energy_type must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function VALID_ENUM_MESSAGE_TYPE_5(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const enumList = ["DELIVERY", "SELF_PICKUP"];
                const enumPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.fulfillment.type",
                );

                const skipCheck = !validations.arePresent(enumPath);
                if (skipCheck) continue;

                const validate = validations.allIn(enumPath, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition VALID_ENUM_MESSAGE_TYPE_5**: every element of $.message.intent.fulfillment.type must be in ["DELIVERY", "SELF_PICKUP"]

	> Note: **Condition VALID_ENUM_MESSAGE_TYPE_5** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.fulfillment.type must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function VALID_ENUM_MESSAGE_TYPE_6(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const enumList = ["OTP", "QR"];
                const enumPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.fulfillment.stops[*].authorization.type",
                );

                const skipCheck = !validations.arePresent(enumPath);
                if (skipCheck) continue;

                const validate = validations.allIn(enumPath, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition VALID_ENUM_MESSAGE_TYPE_6**: every element of $.message.intent.fulfillment.stops[*].authorization.type must be in ["OTP", "QR"]

	> Note: **Condition VALID_ENUM_MESSAGE_TYPE_6** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.fulfillment.stops[*].authorization.type must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function VALID_ENUM_MESSAGE_STATUS_7(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const enumList = ["UNCLAIMED", "CLAIMED"];
                const enumPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.fulfillment.stops[*].authorization.status",
                );

                const skipCheck = !validations.arePresent(enumPath);
                if (skipCheck) continue;

                const validate = validations.allIn(enumPath, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition VALID_ENUM_MESSAGE_STATUS_7**: every element of $.message.intent.fulfillment.stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]

	> Note: **Condition VALID_ENUM_MESSAGE_STATUS_7** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.fulfillment.stops[*].authorization.status must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function VALID_ENUM_MESSAGE_CODE_8(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const enumList = [
                    "RIDE_CANCELLED",
                    "RIDE_ENDED",
                    "RIDE_STARTED",
                    "RIDE_ASSIGNED",
                    "RIDE_ENROUTE_PICKUP",
                    "RIDE_ARRIVED_PICKUP",
                    "RIDE_CONFIRMED",
                ];
                const enumPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.fulfillment.state.descriptor.code",
                );

                const skipCheck = !validations.arePresent(enumPath);
                if (skipCheck) continue;

                const validate = validations.allIn(enumPath, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition VALID_ENUM_MESSAGE_CODE_8**: every element of $.message.intent.fulfillment.state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]

	> Note: **Condition VALID_ENUM_MESSAGE_CODE_8** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.fulfillment.state.descriptor.code must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function VALID_ENUM_MESSAGE_STATUS_9(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const enumList = ["NOT-PAID", "PAID"];
                const enumPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.payment.status",
                );

                const skipCheck = !validations.arePresent(enumPath);
                if (skipCheck) continue;

                const validate = validations.allIn(enumPath, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition VALID_ENUM_MESSAGE_STATUS_9**: every element of $.message.intent.payment.status must be in ["NOT-PAID", "PAID"]

	> Note: **Condition VALID_ENUM_MESSAGE_STATUS_9** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.payment.status must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function VALID_ENUM_MESSAGE_TYPE_10(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const enumList = ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"];
                const enumPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.payment.type",
                );

                const skipCheck = !validations.arePresent(enumPath);
                if (skipCheck) continue;

                const validate = validations.allIn(enumPath, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition VALID_ENUM_MESSAGE_TYPE_10**: every element of $.message.intent.payment.type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]

	> Note: **Condition VALID_ENUM_MESSAGE_TYPE_10** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.payment.type must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_0(input: validationInput): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const validTags = ["BAP_TERMS"];
                const tagPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.tags[*].descriptor.code",
                );

                const skipCheck = !validations.arePresent(tagPath);
                if (skipCheck) continue;

                const validate = validations.allIn(tagPath, validTags);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_0**: every element of $.message.intent.tags[*].descriptor.code must be in ["BAP_TERMS"]

	> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.tags[*].descriptor.code must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_0_BAP_TERMS(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.tags[?(@.descriptor.code=='BAP_TERMS')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = [
                    "BUYER_FINDER_FEES_TYPE",
                    "BUYER_FINDER_FEES_PERCENTAGE",
                    "BUYER_FINDER_FEES_AMOUNT",
                    "SETTLEMENT_WINDOW",
                    "SETTLEMENT_BASIS",
                    "SETTLEMENT_TYPE",
                    "MANDATORY_ARBITRATION",
                    "COURT_JURISDICTION",
                    "DELAY_INTEREST",
                    "STATIC_TERMS",
                    "SETTLEMENT_AMOUNT",
                    "SETTLEMENT_BANK_CODE",
                    "SETTLEMENT_BANK_ACCOUNT_NUMBER",
                    "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS",
                ];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_0_BAP_TERMS**: every element of $.message.intent.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1(input: validationInput): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const validTags = [
                    "DISABILITY_VIS",
                    "DISABILITY_HEA",
                    "DISABILITY_MOB",
                    "DISABILITY_LEP",
                    "DISABILITY_SPE",
                    "DISABILITY_INTEL",
                    "MENTAL",
                    "DISABILITY_BLOOD",
                    "DISABILITY_DWARFISM",
                    "DISABILITY_ACID_ATTACK_SURVIVOR",
                    "DISABILITY_MULTIPLE_DIS",
                ];
                const tagPath = payloadUtils.getJsonPath(
                    testObj,
                    "$.message.intent.item.tags[*].descriptor.code",
                );

                const skipCheck = !validations.arePresent(tagPath);
                if (skipCheck) continue;

                const validate = validations.allIn(tagPath, validTags);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1**: every element of $.message.intent.item.tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS"]

	> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.intent.item.tags[*].descriptor.code must **not** be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_DISABILITY_VIS(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_VIS')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = [
                    "VIS_LEVEL",
                    "VIS_SCREEN_READER_USAGE",
                    "VIS_CANE_USAGE",
                    "VIS_SPECIAL_REQUIREMENT",
                ];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_DISABILITY_VIS**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_DISABILITY_HEA(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_HEA')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = [
                    "HEA_READING_ABILITY",
                    "HEA_SIGN_LANGUAGE_PREFERENCE",
                    "HEA_SPECIAL_REQUIREMENT",
                ];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_DISABILITY_HEA**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_DISABILITY_MOB(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_MOB')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = [
                    "MOB_DISABILITY",
                    "MOB_WHEELCHAIR_USAGE",
                    "MOB_CRUTCHES_USAGE",
                    "MOB_SPECIAL_REQUIREMENT",
                ];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_DISABILITY_MOB**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_DISABILITY_LEP(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_LEP')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = ["LEP_SPECIAL_REQUIREMENT"];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_DISABILITY_LEP**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_DISABILITY_SPE(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_SPE')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = ["SPE_SPECIAL_REQUIREMENT"];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_DISABILITY_SPE**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_DISABILITY_INTEL(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_INTEL')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = [
                    "INTEL_DISABILITY",
                    "INTEL_SPECIAL_REQUIREMENT",
                ];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_DISABILITY_INTEL**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_MENTAL(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='MENTAL')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = [
                    "MENTAL_DISABILITY",
                    "MENTAL_SPECIAL_REQUIREMENT",
                ];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_MENTAL**: every element of $.message.intent.item.tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_DISABILITY_BLOOD(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_BLOOD')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = [
                    "BLOOD_DISABILITY",
                    "BLOOD_SPECIAL_REQUIREMENT",
                ];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_DISABILITY_BLOOD**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_DISABILITY_DWARFISM(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_DWARFISM')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = ["DWARFISM_SPECIAL_REQUIREMENT"];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_DISABILITY_DWARFISM**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = [
                    "ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT",
                ];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function validate_tag_1_DISABILITY_MULTIPLE_DIS(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(
                input.payload,
                "$.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')]",
            );
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const subTags = payloadUtils.getJsonPath(
                    testObj,
                    "$.list[*].descriptor.code",
                );
                const validValues = [
                    "ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT",
                ];

                const validate = validations.allIn(subTags, validValues);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition validate_tag_1_DISABILITY_MULTIPLE_DIS**: every element of $.message.intent.item.tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }

        const testFunctions: testFunctionArray = [
            REQUIRED_CONTEXT_CODE_1,
            REQUIRED_CONTEXT_DOMAIN_3,
            REQUIRED_CONTEXT_TIMESTAMP_4,
            REQUIRED_CONTEXT_BAP_ID_5,
            REQUIRED_CONTEXT_TRANSACTION_ID_6,
            REQUIRED_CONTEXT_MESSAGE_ID_7,
            REQUIRED_CONTEXT_VERSION_8,
            REQUIRED_CONTEXT_ACTION_9,
            REQUIRED_CONTEXT_BAP_URI_10,
            REQUIRED_CONTEXT_TTL_11,
            REQUIRED_MESSAGE_TYPE_12,
            REQUIRED_MESSAGE_COLLECTED_BY_14,
            VALID_ENUM_MESSAGE_CODE_1,
            VALID_ENUM_MESSAGE_CATEGORY_2,
            VALID_ENUM_MESSAGE_VARIANT_3,
            VALID_ENUM_MESSAGE_ENERGY_TYPE_4,
            VALID_ENUM_MESSAGE_TYPE_5,
            VALID_ENUM_MESSAGE_TYPE_6,
            VALID_ENUM_MESSAGE_STATUS_7,
            VALID_ENUM_MESSAGE_CODE_8,
            VALID_ENUM_MESSAGE_STATUS_9,
            VALID_ENUM_MESSAGE_TYPE_10,
            validate_tag_0,
            validate_tag_0_BAP_TERMS,
            validate_tag_1,
            validate_tag_1_DISABILITY_VIS,
            validate_tag_1_DISABILITY_HEA,
            validate_tag_1_DISABILITY_MOB,
            validate_tag_1_DISABILITY_LEP,
            validate_tag_1_DISABILITY_SPE,
            validate_tag_1_DISABILITY_INTEL,
            validate_tag_1_MENTAL,
            validate_tag_1_DISABILITY_BLOOD,
            validate_tag_1_DISABILITY_DWARFISM,
            validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR,
            validate_tag_1_DISABILITY_MULTIPLE_DIS,
        ];

        let invalidResults: validationOutput = [];
        for (const fn of testFunctions) {
            const subResult = fn(input);
            // .filter(r => !r.valid);
            invalidResults = [...invalidResults, ...subResult];
            if (!input.config.runAllValidations && invalidResults.length > 0) {
                return invalidResults;
            }
        }
        if (invalidResults.length > 0) {
            // return invalidResults;
            subResults = invalidResults;
            valid = subResults.every((r) => r.valid);
        }

        delete testObj._EXTERNAL;
    }
    return [{ valid: valid, code: 200 }, ...subResults];
}
