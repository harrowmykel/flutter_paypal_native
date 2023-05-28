import PayPalCheckout

extension ShippingChange {
    func toDictionary() -> [String: Any?] {
        let map: [String: Any?] = [   
            "type": type.description,
            "selectedShippingAddress": selectedShippingAddress.toDictionary(),
            "shippingMethods": shippingMethods.map({ (shippingMethod) in
                shippingMethod.toDictionary()
            }),
            "selectedShippingMethod" : selectedShippingMethod?.toDictionary(),
            "payToken": payToken,
            "paymentID": paymentID,
            "billingToken": billingToken,
        ]
        return map
    }
}