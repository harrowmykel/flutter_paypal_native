import PayPalCheckout

extension ShippingChangeType : CustomStringConvertible {
    public var description: String {
        switch self {
        case .shippingAddress:
            return "shipping_address"
        case .shippingMethod:
            return "shipping_method"
        default:
            return "UNKNOWN"
        }
    }
}