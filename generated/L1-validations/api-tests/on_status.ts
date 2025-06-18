import payloadUtils from "../utils/json-path-utils";
import validations from "../utils/validation-utils";
import {
    testFunctionArray,
    validationInput,
    validationOutput,
} from "../types/test-config";

export default function on_status(input: validationInput): validationOutput {
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
                    validations.arePresent(attr) &&
                    validations.allIn(attr, enumList);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_CODE_1**: all of the following sub conditions must be met:

  - **condition REQUIRED_CONTEXT_CODE_1.1**: $.context.location.country.code must be present in the payload
  - **condition REQUIRED_CONTEXT_CODE_1.2**: every element of $.context.location.country.code must be in ["IND"]`,
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
                const enumList = ["on_status"];

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
  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["on_status"]`,
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
        function REQUIRED_CONTEXT_BPP_ID_12(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.bpp_id",
                );

                const validate = validations.arePresent(attr);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_BPP_ID_12**: $.context.bpp_id must be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function REQUIRED_CONTEXT_BPP_URI_13(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const attr = payloadUtils.getJsonPath(
                    testObj,
                    "$.context.bpp_uri",
                );

                const validate = validations.arePresent(attr);

                if (!validate) {
                    delete testObj._EXTERNAL;
                    return [
                        {
                            valid: false,
                            code: 30000,
                            description: `- **condition REQUIRED_CONTEXT_BPP_URI_13**: $.context.bpp_uri must be present in the payload`,
                        },
                    ];
                }

                delete testObj._EXTERNAL;
            }
            return [{ valid: valid, code: 200 }, ...subResults];
        }
        function on_status_Message_TESTS(
            input: validationInput,
        ): validationOutput {
            const scope = payloadUtils.getJsonPath(input.payload, "$");
            let subResults: validationOutput = [];
            let valid = true;
            for (const testObj of scope) {
                testObj._EXTERNAL = input.externalData;
                const errorBlock = payloadUtils.getJsonPath(
                    testObj,
                    "$.error.code",
                );

                const skipCheck = validations.arePresent(errorBlock);
                if (skipCheck) continue;

                function FULFILLMENT_STATE_ENDED(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(
                        input.payload,
                        "$.message.order.fulfillments[*]",
                    );
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const auth = payloadUtils.getJsonPath(
                            testObj,
                            "$.stops[*].authorization.status",
                        );
                        const authStatus = ["CLAIMED"];
                        const state = payloadUtils.getJsonPath(
                            testObj,
                            "$.state.descriptor.code",
                        );
                        const stateCode = ["RIDE_ENDED", "RIDE_STARTED"];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const skipCheck = !validations.allIn(authStatus, auth);
                        if (skipCheck) continue;

                        const validate = validations.allIn(state, stateCode);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition FULFILLMENT_STATE_ENDED**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_ENDED", "RIDE_STARTED"]

	> Note: **Condition FULFILLMENT_STATE_ENDED** can be skipped if the following conditions are met:
	>
	> - **condition B**: every element of ["CLAIMED"] must **not** be in $.message.order.fulfillments[*].stops[*].authorization.status`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function PAYMENT_STATUS_TRANSACTION_ID(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(
                        input.payload,
                        "$.message.order.payments[*]",
                    );
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const statusCode = ["PAID"];
                        const statusPath = payloadUtils.getJsonPath(
                            testObj,
                            "$.status",
                        );
                        const transactionId = payloadUtils.getJsonPath(
                            testObj,
                            "$.params.transaction_id",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const skipCheck = !validations.allIn(
                            statusPath,
                            statusCode,
                        );
                        if (skipCheck) continue;

                        const validate = validations.arePresent(transactionId);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition PAYMENT_STATUS_TRANSACTION_ID**: $.message.order.payments[*].params.transaction_id must be present in the payload

	> Note: **Condition PAYMENT_STATUS_TRANSACTION_ID** can be skipped if the following conditions are met:
	>
	> - **condition B**: every element of $.message.order.payments[*].status must **not** be in ["PAID"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_ID_14(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.items[*].id",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.items[*].id must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_NAME_15(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.items[*].descriptor.name",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_NAME_15**: $.message.order.items[*].descriptor.name must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_CODE_16(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.items[*].descriptor.code",
                        );
                        const enumList = ["RIDE", "RENTAL"];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate =
                            validations.arePresent(attr) &&
                            validations.allIn(attr, enumList);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_CODE_16**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_CODE_16.1**: $.message.order.items[*].descriptor.code must be present in the payload
  - **condition REQUIRED_MESSAGE_CODE_16.2**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_CURRENCY_17(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.items[*].price.currency",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_CURRENCY_17**: $.message.order.items[*].price.currency must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_VALUE_18(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.items[*].price.value",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_VALUE_18**: $.message.order.items[*].price.value must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_FULFILLMENT_IDS_19(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.items[*].fulfillment_ids[*]",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_FULFILLMENT_IDS_19**: $.message.order.items[*].fulfillment_ids[*] must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_PAYMENT_IDS_20(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.items[*].payment_ids[*]",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_PAYMENT_IDS_20**: $.message.order.items[*].payment_ids[*] must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_ID_21(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.provider.id",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_ID_21**: $.message.order.provider.id must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_ID_22(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].id",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_ID_22**: $.message.order.fulfillments[*].id must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_TYPE_23(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].type",
                        );
                        const enumList = ["DELIVERY", "SELF_PICKUP"];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate =
                            validations.arePresent(attr) &&
                            validations.allIn(attr, enumList);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_TYPE_23**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_TYPE_23.1**: $.message.order.fulfillments[*].type must be present in the payload
  - **condition REQUIRED_MESSAGE_TYPE_23.2**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_GPS_24(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].stops[*].location.gps",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_GPS_24**: $.message.order.fulfillments[*].stops[*].location.gps must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_CATEGORY_25(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].vehicle.category",
                        );
                        const enumList = [
                            "AUTO_RICKSHAW",
                            "CAB",
                            "TWO_WHEELER",
                        ];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate =
                            validations.arePresent(attr) &&
                            validations.allIn(attr, enumList);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_CATEGORY_25**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_CATEGORY_25.1**: $.message.order.fulfillments[*].vehicle.category must be present in the payload
  - **condition REQUIRED_MESSAGE_CATEGORY_25.2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_REGISTRATION_26(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].vehicle.registration",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_REGISTRATION_26**: $.message.order.fulfillments[*].vehicle.registration must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_NAME_27(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].customer.person.name",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_NAME_27**: $.message.order.fulfillments[*].customer.person.name must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_PHONE_28(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].customer.contact.phone",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_PHONE_28**: $.message.order.fulfillments[*].customer.contact.phone must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_NAME_29(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].agent.person.name",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_NAME_29**: $.message.order.fulfillments[*].agent.person.name must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_PHONE_30(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].agent.contact.phone",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_PHONE_30**: $.message.order.fulfillments[*].agent.contact.phone must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_TYPE_31(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].type",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_TYPE_31**: $.message.order.fulfillments[*].type must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_CODE_32(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].state.descriptor.code",
                        );
                        const enumList = [
                            "RIDE_CANCELLED",
                            "RIDE_ENDED",
                            "RIDE_STARTED",
                            "RIDE_ASSIGNED",
                            "RIDE_ENROUTE_PICKUP",
                            "RIDE_ARRIVED_PICKUP",
                            "RIDE_CONFIRMED",
                        ];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate =
                            validations.arePresent(attr) &&
                            validations.allIn(attr, enumList);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_CODE_32**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_CODE_32.1**: $.message.order.fulfillments[*].state.descriptor.code must be present in the payload
  - **condition REQUIRED_MESSAGE_CODE_32.2**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_VALUE_33(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.quote.price.value",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_VALUE_33**: $.message.order.quote.price.value must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_CURRENCY_34(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.quote.price.currency",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_CURRENCY_34**: $.message.order.quote.price.currency must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_TITLE_35(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.quote.breakup[*].title",
                        );
                        const enumList = [
                            "BASE_FARE",
                            "DISTANCE_FARE",
                            "CANCELLATION_CHARGES",
                            "REFUND",
                            "TOLL_CHARGES",
                            "PARKING_CHARGES",
                            "TAX",
                            "WAITING_CHARGES",
                            "DRIVER_BATA",
                            "NIGHT_CHARGES",
                            "BUYER_ADDITIONAL_AMOUNT",
                            "ADD_ONS",
                        ];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate =
                            validations.arePresent(attr) &&
                            validations.allIn(attr, enumList);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_TITLE_35**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_TITLE_35.1**: $.message.order.quote.breakup[*].title must be present in the payload
  - **condition REQUIRED_MESSAGE_TITLE_35.2**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT", "ADD_ONS"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_CURRENCY_36(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.quote.breakup[*].price.currency",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_CURRENCY_36**: $.message.order.quote.breakup[*].price.currency must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_VALUE_37(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.quote.breakup[*].price.value",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_VALUE_37**: $.message.order.quote.breakup[*].price.value must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_ID_38(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.payments[*].id",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_ID_38**: $.message.order.payments[*].id must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_COLLECTED_BY_39(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.payments[*].collected_by",
                        );
                        const enumList = ["BPP", "BAP"];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate =
                            validations.arePresent(attr) &&
                            validations.allIn(attr, enumList);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_COLLECTED_BY_39**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_COLLECTED_BY_39.1**: $.message.order.payments[*].collected_by must be present in the payload
  - **condition REQUIRED_MESSAGE_COLLECTED_BY_39.2**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_STATUS_40(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.payments[*].status",
                        );
                        const enumList = ["NOT-PAID", "PAID"];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate =
                            validations.arePresent(attr) &&
                            validations.allIn(attr, enumList);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_STATUS_40**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_STATUS_40.1**: $.message.order.payments[*].status must be present in the payload
  - **condition REQUIRED_MESSAGE_STATUS_40.2**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_TYPE_41(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.payments[*].type",
                        );
                        const enumList = [
                            "PRE-ORDER",
                            "ON-ORDER",
                            "ON-FULFILLMENT",
                        ];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate =
                            validations.arePresent(attr) &&
                            validations.allIn(attr, enumList);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_TYPE_41**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_TYPE_41.1**: $.message.order.payments[*].type must be present in the payload
  - **condition REQUIRED_MESSAGE_TYPE_41.2**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_CODE_45(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.cancellation_terms[*].fulfillment_state.descriptor.code",
                        );
                        const enumList = [
                            "RIDE_CANCELLED",
                            "RIDE_ENDED",
                            "RIDE_STARTED",
                            "RIDE_ASSIGNED",
                            "RIDE_ENROUTE_PICKUP",
                            "RIDE_ARRIVED_PICKUP",
                            "RIDE_CONFIRMED",
                        ];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate =
                            validations.arePresent(attr) &&
                            validations.allIn(attr, enumList);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_CODE_45**: all of the following sub conditions must be met:

  - **condition REQUIRED_MESSAGE_CODE_45.1**: $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be present in the payload
  - **condition REQUIRED_MESSAGE_CODE_45.2**: every element of $.message.order.cancellation_terms[*].fulfillment_state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function REQUIRED_MESSAGE_REASON_REQUIRED_46(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const attr = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.cancellation_terms[*].reason_required",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.arePresent(attr);

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition REQUIRED_MESSAGE_REASON_REQUIRED_46**: $.message.order.cancellation_terms[*].reason_required must be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function VALID_ENUM_MESSAGE_VARIANT_1(
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
                            "$.message.order.fulfillments[*].vehicle.variant",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
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
                                    description: `- **condition VALID_ENUM_MESSAGE_VARIANT_1**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]

	> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_1** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function VALID_ENUM_MESSAGE_ENERGY_TYPE_2(
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
                            "$.message.order.fulfillments[*].vehicle.energy_type",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
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
                                    description: `- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]

	> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_2** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function VALID_ENUM_MESSAGE_TYPE_3(
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
                            "$.message.order.fulfillments[*].stops[*].authorization.type",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
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
                                    description: `- **condition VALID_ENUM_MESSAGE_TYPE_3**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]

	> Note: **Condition VALID_ENUM_MESSAGE_TYPE_3** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function VALID_ENUM_MESSAGE_STATUS_4(
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
                            "$.message.order.fulfillments[*].stops[*].authorization.status",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
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
                                    description: `- **condition VALID_ENUM_MESSAGE_STATUS_4**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]

	> Note: **Condition VALID_ENUM_MESSAGE_STATUS_4** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function VALID_ENUM_MESSAGE_STATUS_5(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const enumList = [
                            "SOFT_CANCEL",
                            "CONFIRM_CANCEL",
                            "ACTIVE",
                            "COMPLETE",
                            "CANCELLED",
                            "CONFIRM_UPDATE",
                            "UPDATED",
                            "SOFT_UPDATE",
                        ];
                        const enumPath = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.status",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
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
                                    description: `- **condition VALID_ENUM_MESSAGE_STATUS_5**: every element of $.message.order.status must be in ["SOFT_CANCEL", "CONFIRM_CANCEL", "ACTIVE", "COMPLETE", "CANCELLED", "CONFIRM_UPDATE", "UPDATED", "SOFT_UPDATE"]

	> Note: **Condition VALID_ENUM_MESSAGE_STATUS_5** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.status must **not** be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function validate_tag_0(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const validTags = ["BAP_TERMS", "BPP_TERMS"];
                        const tagPath = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.tags[*].descriptor.code",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
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
                                    description: `- **condition validate_tag_0**: every element of $.message.order.tags[*].descriptor.code must be in ["BAP_TERMS", "BPP_TERMS"]

	> Note: **Condition validate_tag_0** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.tags[*].descriptor.code must **not** be present in the payload`,
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
                        "$.message.order.tags[?(@.descriptor.code=='BAP_TERMS')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_0_BAP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BAP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT", "SETTLEMENT_BANK_CODE", "SETTLEMENT_BANK_ACCOUNT_NUMBER", "SETTLEMENT_VIRTUAL_PAYMENT_ADDRESS"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function validate_tag_0_BPP_TERMS(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(
                        input.payload,
                        "$.message.order.tags[?(@.descriptor.code=='BPP_TERMS')]",
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
                        ];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_0_BPP_TERMS**: every element of $.message.order.tags[?(@.descriptor.code=='BPP_TERMS')].list[*].descriptor.code must be in ["BUYER_FINDER_FEES_TYPE", "BUYER_FINDER_FEES_PERCENTAGE", "BUYER_FINDER_FEES_AMOUNT", "SETTLEMENT_WINDOW", "SETTLEMENT_BASIS", "SETTLEMENT_TYPE", "MANDATORY_ARBITRATION", "COURT_JURISDICTION", "DELAY_INTEREST", "STATIC_TERMS", "SETTLEMENT_AMOUNT"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function validate_tag_1(
                    input: validationInput,
                ): validationOutput {
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
                            "FARE_POLICY",
                            "INFO",
                            "FEATURE_LIST",
                        ];
                        const tagPath = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.items[*].tags[*].descriptor.code",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
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
                                    description: `- **condition validate_tag_1**: every element of $.message.order.items[*].tags[*].descriptor.code must be in ["DISABILITY_VIS", "DISABILITY_HEA", "DISABILITY_MOB", "DISABILITY_LEP", "DISABILITY_SPE", "DISABILITY_INTEL", "MENTAL", "DISABILITY_BLOOD", "DISABILITY_DWARFISM", "DISABILITY_ACID_ATTACK_SURVIVOR", "DISABILITY_MULTIPLE_DIS", "FARE_POLICY", "INFO", "FEATURE_LIST"]

	> Note: **Condition validate_tag_1** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.items[*].tags[*].descriptor.code must **not** be present in the payload`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')]",
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
                            "FEATURE_LIST",
                        ];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_DISABILITY_VIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_VIS')].list[*].descriptor.code must be in ["VIS_LEVEL", "VIS_SCREEN_READER_USAGE", "VIS_CANE_USAGE", "VIS_SPECIAL_REQUIREMENT", "FEATURE_LIST"]`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_DISABILITY_HEA**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_HEA')].list[*].descriptor.code must be in ["HEA_READING_ABILITY", "HEA_SIGN_LANGUAGE_PREFERENCE", "HEA_SPECIAL_REQUIREMENT"]`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_DISABILITY_MOB**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MOB')].list[*].descriptor.code must be in ["MOB_DISABILITY", "MOB_WHEELCHAIR_USAGE", "MOB_CRUTCHES_USAGE", "MOB_SPECIAL_REQUIREMENT"]`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_DISABILITY_LEP**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_LEP')].list[*].descriptor.code must be in ["LEP_SPECIAL_REQUIREMENT"]`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_DISABILITY_SPE**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_SPE')].list[*].descriptor.code must be in ["SPE_SPECIAL_REQUIREMENT"]`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_DISABILITY_INTEL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_INTEL')].list[*].descriptor.code must be in ["INTEL_DISABILITY", "INTEL_SPECIAL_REQUIREMENT"]`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_MENTAL**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='MENTAL')].list[*].descriptor.code must be in ["MENTAL_DISABILITY", "MENTAL_SPECIAL_REQUIREMENT"]`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_DISABILITY_BLOOD**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_BLOOD')].list[*].descriptor.code must be in ["BLOOD_DISABILITY", "BLOOD_SPECIAL_REQUIREMENT"]`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_DISABILITY_DWARFISM**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_DWARFISM')].list[*].descriptor.code must be in ["DWARFISM_SPECIAL_REQUIREMENT"]`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_DISABILITY_ACID_ATTACK_SURVIVOR**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_ACID_ATTACK_SURVIVOR')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]`,
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
                        "$.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')]",
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
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_DISABILITY_MULTIPLE_DIS**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='DISABILITY_MULTIPLE_DIS')].list[*].descriptor.code must be in ["ACID_ATTACK_SURVIVOR_SPECIAL_REQUIREMENT"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function validate_tag_1_FARE_POLICY(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(
                        input.payload,
                        "$.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')]",
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
                            "MIN_FARE",
                            "MIN_FARE_DISTANCE_KM",
                            "PER_KM_CHARGE",
                            "PICKUP_CHARGE",
                            "WAITING_CHARGE_PER_MIN",
                            "NIGHT_CHARGE_MULTIPLIER",
                            "NIGHT_SHIFT_START_TIME",
                            "NIGHT_SHIFT_END_TIME",
                        ];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_FARE_POLICY**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='FARE_POLICY')].list[*].descriptor.code must be in ["MIN_FARE", "MIN_FARE_DISTANCE_KM", "PER_KM_CHARGE", "PICKUP_CHARGE", "WAITING_CHARGE_PER_MIN", "NIGHT_CHARGE_MULTIPLIER", "NIGHT_SHIFT_START_TIME", "NIGHT_SHIFT_END_TIME"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function validate_tag_1_INFO(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(
                        input.payload,
                        "$.message.order.items[*].tags[?(@.descriptor.code=='INFO')]",
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
                            "DISTANCE_TO_NEAREST_DRIVER_METER",
                            "ETA_TO_NEAREST_DRIVER_MIN",
                            "TOTAL_HOURS",
                            "TOTAL_DISTANCE",
                        ];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_1_INFO**: every element of $.message.order.items[*].tags[?(@.descriptor.code=='INFO')].list[*].descriptor.code must be in ["DISTANCE_TO_NEAREST_DRIVER_METER", "ETA_TO_NEAREST_DRIVER_MIN", "TOTAL_HOURS", "TOTAL_DISTANCE"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function validate_tag_2(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(input.payload, "$");
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const validTags = ["ROUTE_INFO"];
                        const tagPath = payloadUtils.getJsonPath(
                            testObj,
                            "$.message.order.fulfillments[*].tags[*].descriptor.code",
                        );
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
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
                                    description: `- **condition validate_tag_2**: every element of $.message.order.fulfillments[*].tags[*].descriptor.code must be in ["ROUTE_INFO"]

	> Note: **Condition validate_tag_2** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].tags[*].descriptor.code must **not** be present in the payload`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }
                function validate_tag_2_ROUTE_INFO(
                    input: validationInput,
                ): validationOutput {
                    const scope = payloadUtils.getJsonPath(
                        input.payload,
                        "$.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')]",
                    );
                    let subResults: validationOutput = [];
                    let valid = true;
                    for (const testObj of scope) {
                        testObj._EXTERNAL = input.externalData;
                        const subTags = payloadUtils.getJsonPath(
                            testObj,
                            "$.list[*].descriptor.code",
                        );
                        const validValues = ["ENCODED_POLYLINE", "WAYPOINTS"];
                        const errorBlock = payloadUtils.getJsonPath(
                            testObj,
                            "$._EXTERNAL._SELF.error.code",
                        );

                        const validate = validations.allIn(
                            subTags,
                            validValues,
                        );

                        if (!validate) {
                            delete testObj._EXTERNAL;
                            return [
                                {
                                    valid: false,
                                    code: 30000,
                                    description: `- **condition validate_tag_2_ROUTE_INFO**: every element of $.message.order.fulfillments[*].tags[?(@.descriptor.code=='ROUTE_INFO')].list[*].descriptor.code must be in ["ENCODED_POLYLINE", "WAYPOINTS"]`,
                                },
                            ];
                        }

                        delete testObj._EXTERNAL;
                    }
                    return [{ valid: valid, code: 200 }, ...subResults];
                }

                const testFunctions: testFunctionArray = [
                    FULFILLMENT_STATE_ENDED,
                    PAYMENT_STATUS_TRANSACTION_ID,
                    REQUIRED_MESSAGE_ID_14,
                    REQUIRED_MESSAGE_NAME_15,
                    REQUIRED_MESSAGE_CODE_16,
                    REQUIRED_MESSAGE_CURRENCY_17,
                    REQUIRED_MESSAGE_VALUE_18,
                    REQUIRED_MESSAGE_FULFILLMENT_IDS_19,
                    REQUIRED_MESSAGE_PAYMENT_IDS_20,
                    REQUIRED_MESSAGE_ID_21,
                    REQUIRED_MESSAGE_ID_22,
                    REQUIRED_MESSAGE_TYPE_23,
                    REQUIRED_MESSAGE_GPS_24,
                    REQUIRED_MESSAGE_CATEGORY_25,
                    REQUIRED_MESSAGE_REGISTRATION_26,
                    REQUIRED_MESSAGE_NAME_27,
                    REQUIRED_MESSAGE_PHONE_28,
                    REQUIRED_MESSAGE_NAME_29,
                    REQUIRED_MESSAGE_PHONE_30,
                    REQUIRED_MESSAGE_TYPE_31,
                    REQUIRED_MESSAGE_CODE_32,
                    REQUIRED_MESSAGE_VALUE_33,
                    REQUIRED_MESSAGE_CURRENCY_34,
                    REQUIRED_MESSAGE_TITLE_35,
                    REQUIRED_MESSAGE_CURRENCY_36,
                    REQUIRED_MESSAGE_VALUE_37,
                    REQUIRED_MESSAGE_ID_38,
                    REQUIRED_MESSAGE_COLLECTED_BY_39,
                    REQUIRED_MESSAGE_STATUS_40,
                    REQUIRED_MESSAGE_TYPE_41,
                    REQUIRED_MESSAGE_CODE_45,
                    REQUIRED_MESSAGE_REASON_REQUIRED_46,
                    VALID_ENUM_MESSAGE_VARIANT_1,
                    VALID_ENUM_MESSAGE_ENERGY_TYPE_2,
                    VALID_ENUM_MESSAGE_TYPE_3,
                    VALID_ENUM_MESSAGE_STATUS_4,
                    VALID_ENUM_MESSAGE_STATUS_5,
                    validate_tag_0,
                    validate_tag_0_BAP_TERMS,
                    validate_tag_0_BPP_TERMS,
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
                    validate_tag_1_FARE_POLICY,
                    validate_tag_1_INFO,
                    validate_tag_2,
                    validate_tag_2_ROUTE_INFO,
                ];

                let invalidResults: validationOutput = [];
                for (const fn of testFunctions) {
                    const subResult = fn(input);
                    // .filter(r => !r.valid);
                    invalidResults = [...invalidResults, ...subResult];
                    if (
                        !input.config.runAllValidations &&
                        invalidResults.length > 0
                    ) {
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
            REQUIRED_CONTEXT_BPP_ID_12,
            REQUIRED_CONTEXT_BPP_URI_13,
            on_status_Message_TESTS,
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
