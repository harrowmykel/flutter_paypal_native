import PayPalCheckout

extension UnitAmount {
    func toDictionary() -> [String: Any?] {
        let unitAmountMap: [String: Any?] = [
            "currencyCode": currencyCodeString,
            "currencyFormat": currencyFormat,
            "currencySymbol": currencyCodeString,
            "currencyValue": value,
        ]
        return unitAmountMap
    }
}