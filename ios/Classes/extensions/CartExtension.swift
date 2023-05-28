import PayPalCheckout

extension Cart {
    func toDictionary() -> [String: Any?] {
        var map: [String: Any?] = [
                "cartId": cartID,
                "intent": intent,
                "total": total.toDictionary(),
                "shippingAddress": shippingAddress?.toDictionary(),
                "billingAddress": billingAddress?.toDictionary(),
                "totalAllowedOverCaptureAmount": totalAllowedOverCaptureAmount.toDictionary() as [String: Any?],
              
                //                "billingToken": billingToken,
                //                "billingType": billingType?.rawValue,
                //                "cancelUrl": cancelURL?.absoluteString,
                //                "returnUrl": returnURL?.absoluteString,
        ]
        map["items"] = items.map({ (item) -> [String: Any?] in
            return item.toDictionary()
        })
        map["shippingMethods"] = shippingMethods.map({ (item) -> [String: Any?] in
            return item.toDictionary()
        })
        return map
    }
}
