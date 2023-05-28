import PayPalCheckout

extension ShippingChangeAddress {
    func toDictionary() -> [String: Any?] {
        return [
            // "addressID": addressID,
            // "fullName": fullName,
            "adminArea1": adminArea1,
            "adminArea2": adminArea2,
            // "adminArea3": adminArea3,
            // "adminArea4": adminArea4,
            "postalCode": postalCode,
            "countryCode": countryCode
        ]
    }
}