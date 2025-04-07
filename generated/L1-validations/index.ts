import normalizeKeys from "./utils/json-normalizer";
import search from "./api-tests/search";
import select from "./api-tests/select";
import init from "./api-tests/init";
import confirm from "./api-tests/confirm";
import status from "./api-tests/status";
import cancel from "./api-tests/cancel";
import update from "./api-tests/update";
import on_search from "./api-tests/on_search";
import on_select from "./api-tests/on_select";
import on_init from "./api-tests/on_init";
import on_confirm from "./api-tests/on_confirm";
import on_cancel from "./api-tests/on_cancel";
import on_update from "./api-tests/on_update";
import on_status from "./api-tests/on_status";
import track from "./api-tests/track";
import on_track from "./api-tests/on_track";

export function performL1validations(
action: string,
payload: any,
allErrors = false,
externalData = {},
) {
const normalizedPayload = normalizeKeys(payload);
externalData._SELF = normalizedPayload;
switch (action) {
case "search":
return search({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "select":
return select({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "init":
return init({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "confirm":
return confirm({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "status":
return status({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "cancel":
return cancel({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "update":
return update({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "on_search":
return on_search({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "on_select":
return on_select({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "on_init":
return on_init({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "on_confirm":
return on_confirm({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "on_cancel":
return on_cancel({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "on_update":
return on_update({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "on_status":
return on_status({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "track":
return track({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
case "on_track":
return on_track({
payload: normalizedPayload,
externalData: externalData,
config: {
runAllValidations: allErrors,
},
});
default:
throw new Error("Action not found");
}
}
