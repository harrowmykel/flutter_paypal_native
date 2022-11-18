import PayPalCheckout

extension CartAddress {
    func toDictionary() -> [String: Any?] {
        let cartAddressMap: [String: Any?] = [
            "firstName": firstName,
            "lastName": lastName,
            "line1": line1,
            "line2": line2,
            "city": city,
            "state": state,
            "postalCode": postalCode,
            "country": country
        ]
        return cartAddressMap
    }
}