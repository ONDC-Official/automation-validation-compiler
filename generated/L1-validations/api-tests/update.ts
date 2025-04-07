import payloadUtils from "../utils/json-path-utils";
import validations from "../utils/validation-utils";
import {
testFunctionArray,
validationInput,
validationOutput,
} from "../types/test-config";

export default function update(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;

function FULFILLMENT_STATE_ENDED(input: validationInput): validationOutput {
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
const state = payloadUtils.getJsonPath(testObj, "$.state.descriptor.code");
const stateCode = ["RIDE_ENDED", "RIDE_STARTED"];

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
const statusPath = payloadUtils.getJsonPath(testObj, "$.status");
const transactionId = payloadUtils.getJsonPath(
testObj,
"$.params.transaction_id",
);

const skipCheck = !validations.allIn(statusPath, statusCode);
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
function REQUIRED_CONTEXT_CODE_1(input: validationInput): validationOutput {
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
validations.arePresent(attr) && validations.allIn(attr, enumList);

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
function REQUIRED_CONTEXT_DOMAIN_3(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const attr = payloadUtils.getJsonPath(testObj, "$.context.domain");
const enumList = ["ONDC:TRV10"];

const validate =
validations.arePresent(attr) && validations.allIn(attr, enumList);

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
const attr = payloadUtils.getJsonPath(testObj, "$.context.timestamp");

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
function REQUIRED_CONTEXT_BAP_ID_5(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const attr = payloadUtils.getJsonPath(testObj, "$.context.bap_id");

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
const attr = payloadUtils.getJsonPath(testObj, "$.context.transaction_id");

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
const attr = payloadUtils.getJsonPath(testObj, "$.context.message_id");

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
function REQUIRED_CONTEXT_VERSION_8(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const attr = payloadUtils.getJsonPath(testObj, "$.context.version");

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
function REQUIRED_CONTEXT_ACTION_9(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const attr = payloadUtils.getJsonPath(testObj, "$.context.action");
const enumList = ["update"];

const validate =
validations.arePresent(attr) && validations.allIn(attr, enumList);

if (!validate) {
delete testObj._EXTERNAL;
return [
{
valid: false,
code: 30000,
description: `- **condition REQUIRED_CONTEXT_ACTION_9**: all of the following sub conditions must be met:

  - **condition REQUIRED_CONTEXT_ACTION_9.1**: $.context.action must be present in the payload
  - **condition REQUIRED_CONTEXT_ACTION_9.2**: every element of $.context.action must be in ["update"]`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function REQUIRED_CONTEXT_BAP_URI_10(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const attr = payloadUtils.getJsonPath(testObj, "$.context.bap_uri");

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
function REQUIRED_CONTEXT_TTL_11(input: validationInput): validationOutput {
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
function REQUIRED_CONTEXT_BPP_ID_12(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const attr = payloadUtils.getJsonPath(testObj, "$.context.bpp_id");

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
function REQUIRED_CONTEXT_BPP_URI_13(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const attr = payloadUtils.getJsonPath(testObj, "$.context.bpp_uri");

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
function REQUIRED_MESSAGE_ID_14(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const attr = payloadUtils.getJsonPath(testObj, "$.message.order.id");

const validate = validations.arePresent(attr);

if (!validate) {
delete testObj._EXTERNAL;
return [
{
valid: false,
code: 30000,
description: `- **condition REQUIRED_MESSAGE_ID_14**: $.message.order.id must be present in the payload`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function VALID_ENUM_MESSAGE_CODE_1(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const enumList = ["RIDE", "RENTAL"];
const enumPath = payloadUtils.getJsonPath(
testObj,
"$.message.order.items[*].descriptor.code",
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
description: `- **condition VALID_ENUM_MESSAGE_CODE_1**: every element of $.message.order.items[*].descriptor.code must be in ["RIDE", "RENTAL"]

	> Note: **Condition VALID_ENUM_MESSAGE_CODE_1** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.items[*].descriptor.code must **not** be present in the payload`,
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
"$.message.order.fulfillments[*].vehicle.category",
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
description: `- **condition VALID_ENUM_MESSAGE_CATEGORY_2**: every element of $.message.order.fulfillments[*].vehicle.category must be in ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"]

	> Note: **Condition VALID_ENUM_MESSAGE_CATEGORY_2** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].vehicle.category must **not** be present in the payload`,
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
const enumList = ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"];
const enumPath = payloadUtils.getJsonPath(
testObj,
"$.message.order.fulfillments[*].vehicle.variant",
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
description: `- **condition VALID_ENUM_MESSAGE_VARIANT_3**: every element of $.message.order.fulfillments[*].vehicle.variant must be in ["SEDAN", "SUV", "HATCHBACK", "TWO_WHEELER", "AUTO_RICKSHAW"]

	> Note: **Condition VALID_ENUM_MESSAGE_VARIANT_3** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].vehicle.variant must **not** be present in the payload`,
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
"$.message.order.fulfillments[*].vehicle.energy_type",
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
description: `- **condition VALID_ENUM_MESSAGE_ENERGY_TYPE_4**: every element of $.message.order.fulfillments[*].vehicle.energy_type must be in ["ELECTRIC", "PETRO", "DIESEL", "HYDROGEN", "BIOFUELS", "CNG", "LPG"]

	> Note: **Condition VALID_ENUM_MESSAGE_ENERGY_TYPE_4** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].vehicle.energy_type must **not** be present in the payload`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function VALID_ENUM_MESSAGE_TYPE_5(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const enumList = ["DELIVERY", "SELF_PICKUP"];
const enumPath = payloadUtils.getJsonPath(
testObj,
"$.message.order.fulfillments[*].type",
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
description: `- **condition VALID_ENUM_MESSAGE_TYPE_5**: every element of $.message.order.fulfillments[*].type must be in ["DELIVERY", "SELF_PICKUP"]

	> Note: **Condition VALID_ENUM_MESSAGE_TYPE_5** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].type must **not** be present in the payload`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function VALID_ENUM_MESSAGE_TYPE_6(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const enumList = ["START", "END", "INTERMEDIATE_STOP"];
const enumPath = payloadUtils.getJsonPath(
testObj,
"$.message.order.fulfillments[*].type",
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
description: `- **condition VALID_ENUM_MESSAGE_TYPE_6**: every element of $.message.order.fulfillments[*].type must be in ["START", "END", "INTERMEDIATE_STOP"]

	> Note: **Condition VALID_ENUM_MESSAGE_TYPE_6** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].type must **not** be present in the payload`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function VALID_ENUM_MESSAGE_TYPE_7(input: validationInput): validationOutput {
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

const skipCheck = !validations.arePresent(enumPath);
if (skipCheck) continue;

const validate = validations.allIn(enumPath, enumList);

if (!validate) {
delete testObj._EXTERNAL;
return [
{
valid: false,
code: 30000,
description: `- **condition VALID_ENUM_MESSAGE_TYPE_7**: every element of $.message.order.fulfillments[*].stops[*].authorization.type must be in ["OTP", "QR"]

	> Note: **Condition VALID_ENUM_MESSAGE_TYPE_7** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.type must **not** be present in the payload`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function VALID_ENUM_MESSAGE_STATUS_8(input: validationInput): validationOutput {
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

const skipCheck = !validations.arePresent(enumPath);
if (skipCheck) continue;

const validate = validations.allIn(enumPath, enumList);

if (!validate) {
delete testObj._EXTERNAL;
return [
{
valid: false,
code: 30000,
description: `- **condition VALID_ENUM_MESSAGE_STATUS_8**: every element of $.message.order.fulfillments[*].stops[*].authorization.status must be in ["UNCLAIMED", "CLAIMED"]

	> Note: **Condition VALID_ENUM_MESSAGE_STATUS_8** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].stops[*].authorization.status must **not** be present in the payload`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function VALID_ENUM_MESSAGE_CODE_9(input: validationInput): validationOutput {
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
"$.message.order.fulfillments[*].state.descriptor.code",
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
description: `- **condition VALID_ENUM_MESSAGE_CODE_9**: every element of $.message.order.fulfillments[*].state.descriptor.code must be in ["RIDE_CANCELLED", "RIDE_ENDED", "RIDE_STARTED", "RIDE_ASSIGNED", "RIDE_ENROUTE_PICKUP", "RIDE_ARRIVED_PICKUP", "RIDE_CONFIRMED"]

	> Note: **Condition VALID_ENUM_MESSAGE_CODE_9** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.fulfillments[*].state.descriptor.code must **not** be present in the payload`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function VALID_ENUM_MESSAGE_STATUS_10(
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
"$.message.order.payments[*].status",
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
description: `- **condition VALID_ENUM_MESSAGE_STATUS_10**: every element of $.message.order.payments[*].status must be in ["NOT-PAID", "PAID"]

	> Note: **Condition VALID_ENUM_MESSAGE_STATUS_10** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.payments[*].status must **not** be present in the payload`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function VALID_ENUM_MESSAGE_COLLECTED_BY_11(
input: validationInput,
): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const enumList = ["BPP", "BAP"];
const enumPath = payloadUtils.getJsonPath(
testObj,
"$.message.order.payments[*].collected_by",
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
description: `- **condition VALID_ENUM_MESSAGE_COLLECTED_BY_11**: every element of $.message.order.payments[*].collected_by must be in ["BPP", "BAP"]

	> Note: **Condition VALID_ENUM_MESSAGE_COLLECTED_BY_11** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.payments[*].collected_by must **not** be present in the payload`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function VALID_ENUM_MESSAGE_TYPE_12(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
const enumList = ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"];
const enumPath = payloadUtils.getJsonPath(
testObj,
"$.message.order.payments[*].type",
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
description: `- **condition VALID_ENUM_MESSAGE_TYPE_12**: every element of $.message.order.payments[*].type must be in ["PRE-ORDER", "ON-ORDER", "ON-FULFILLMENT"]

	> Note: **Condition VALID_ENUM_MESSAGE_TYPE_12** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.payments[*].type must **not** be present in the payload`,
},
];
}

delete testObj._EXTERNAL;
}
return [{ valid: valid, code: 200 }, ...subResults];
}
function VALID_ENUM_MESSAGE_TITLE_13(input: validationInput): validationOutput {
const scope = payloadUtils.getJsonPath(input.payload, "$");
let subResults: validationOutput = [];
let valid = true;
for (const testObj of scope) {
testObj._EXTERNAL = input.externalData;
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
const enumPath = payloadUtils.getJsonPath(
testObj,
"$.message.order.quote.breakup[*].title",
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
description: `- **condition VALID_ENUM_MESSAGE_TITLE_13**: every element of $.message.order.quote.breakup[*].title must be in ["BASE_FARE", "DISTANCE_FARE", "CANCELLATION_CHARGES", "REFUND", "TOLL_CHARGES", "PARKING_CHARGES", "TAX", "WAITING_CHARGES", "DRIVER_BATA", "NIGHT_CHARGES", "BUYER_ADDITIONAL_AMOUNT", "ADD_ONS"]

	> Note: **Condition VALID_ENUM_MESSAGE_TITLE_13** can be skipped if the following conditions are met:
	>
	> - **condition B**: $.message.order.quote.breakup[*].title must **not** be present in the payload`,
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
REQUIRED_MESSAGE_ID_14,
VALID_ENUM_MESSAGE_CODE_1,
VALID_ENUM_MESSAGE_CATEGORY_2,
VALID_ENUM_MESSAGE_VARIANT_3,
VALID_ENUM_MESSAGE_ENERGY_TYPE_4,
VALID_ENUM_MESSAGE_TYPE_5,
VALID_ENUM_MESSAGE_TYPE_6,
VALID_ENUM_MESSAGE_TYPE_7,
VALID_ENUM_MESSAGE_STATUS_8,
VALID_ENUM_MESSAGE_CODE_9,
VALID_ENUM_MESSAGE_STATUS_10,
VALID_ENUM_MESSAGE_COLLECTED_BY_11,
VALID_ENUM_MESSAGE_TYPE_12,
VALID_ENUM_MESSAGE_TITLE_13,
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
