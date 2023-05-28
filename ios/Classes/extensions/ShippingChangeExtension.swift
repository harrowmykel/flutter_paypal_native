import PayPalCheckout

extension ShippingChange {
    func toDictionary() -> [String: Any?] {
        let map: [String: Any?] = [   
            "shippingChangeType": type.humanText,
            "shippingAddress": selectedShippingAddress.toDictionary(),
            "shippingOptions": shippingMethods.map({ (shippingMethod) in
                shippingMethod.toDictionary()
            }),
            "selectedShippingOption" : selectedShippingMethod?.toDictionary(),
        ]
        return map
    }
}