import action from "./api-tests/action";

export function performL1Validations(
    action: string,
    payload: any,
    allErrors = false,
    externalData = {},
) {
    switch (action) {
        case "action":
            return action({
                payload: payload,
                externalData: externalData,
                config: {
                    runAllValidations: allErrors,
                },
            });
        default:
            throw new Error("Action not found");
    }
}
