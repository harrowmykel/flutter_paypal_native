import PayPalCheckout

extension CorrelationIDs {
    func toDictionary() -> [String: Any?] {
        return [
            "fundingEligibilityDebugID": fundingEligibilityDebugID,
            "eligibilityDebugID": eligibilityDebugID,
            "updateClientConfigDebugID": updateClientConfigDebugID,
            "lsatUpgradeDebugID": lsatUpgradeDebugID,
            "fetchPayloadDebugID": fetchPayloadDebugID,
            "fetchCartDebugIDs": fetchCartDebugIDs,
            "currencyConversionDebugID": currencyConversionDebugID,
            "completeSCADebugID": completeSCADebugID,
            "finishCheckoutDebugID": finishCheckoutDebugID,
            "riskCorrelationID": riskCorrelationID,
        ]
    }
}