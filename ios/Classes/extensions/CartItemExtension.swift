import PayPalCheckout

extension CartItem {
    func toDictionary() -> [String: Any?] {
        var cartItemMap: [String: Any?] = [
            "name": name,
            "description": itemDescription,
            "quantity": quantity,
        ]
        cartItemMap["total"] = total.toDictionary()
        cartItemMap["unitPrice"] = unitPrice.toDictionary()
        return cartItemMap
    }
}
