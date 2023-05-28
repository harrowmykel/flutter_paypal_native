import PayPalCheckout

extension  ShippingType : CustomStringConvertible {
    public var description: String {
        switch self {
        case .shipping:
            return "SHIPPING"
        case .pickup:
            return "PICKUP"
        case .none:
            return "NONE"
        default:
            return "unknown"
        }
    }
}