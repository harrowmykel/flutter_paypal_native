import PayPalCheckout

extension ShippingChangeType {
    public var description: String {
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