import PayPalCheckout

extension PayPalCheckout.UserAction {
    init(rawValueString: String) {
        switch rawValueString {
        case "payNow":
            self = .payNow
        case "continuePayment":
            self = .continue
        default:
            self = .payNow
        }
    }
}