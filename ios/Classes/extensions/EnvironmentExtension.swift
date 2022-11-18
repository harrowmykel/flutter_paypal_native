import PayPalCheckout

extension PayPalCheckout.Environment {
    init(rawValueString: String) {
        switch rawValueString {
        case "sandbox":
            self = .sandbox
        case "live":
            self = .live
        default:
            self = .stage
        }
    }
}