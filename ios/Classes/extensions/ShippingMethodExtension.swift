import PayPalCheckout

extension ShippingMethod {
    func toDictionary() -> [String: Any?] {
        return [
            "id": id,
            "label": label,
            "selected": selected,
            "type": type.description,
            "amount": amount?.toDictionary()
        ]
    }
}