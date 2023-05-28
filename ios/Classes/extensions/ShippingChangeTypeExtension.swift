import PayPalCheckout

extension ShippingChangeType : CustomStringConvertible {
    public var humanText: String {
        switch self {
        case .shippingAddress:
            return "ADDRESS_CHANGE"
        case .shippingMethod:
            return "OPTION_CHANGE"
        default:
            return "UNKNOWN"
        }
    }
}