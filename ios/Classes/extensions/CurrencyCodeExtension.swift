import PayPalCheckout

extension PayPalCheckout.CurrencyCode {
    static func withLabel(rawValue: String) -> CurrencyCode {
        for currency in CurrencyCode.allCases {
            if currency.stringValue == rawValue {
                return CurrencyCode.currencyCode(from: rawValue)!
            }
        }
        return CurrencyCode.currencyCode(from: "USD")!
    }
}