import PayPalCheckout

extension  ShippingType : CustomStringConvertible {
    public var description: String {
        switch self {
        case .shipping:
            return "shipping"
        case .pickup:
            return "pickup"
        case .none:
            return "none"
        default:
            return "unknown"
        }
    }
}