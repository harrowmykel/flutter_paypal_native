import PayPalCheckout

public class CheckoutConfigStore {
    let clientId: String
    let payPalEnvironment: Environment
    let returnUrl: String
    let currency: CurrencyCode
    let userAction: UserAction

    public init(clientId: String, payPalEnvironment: Environment, returnUrl: String, currency: CurrencyCode, userAction: UserAction) {
        self.clientId = clientId
        self.payPalEnvironment = payPalEnvironment
        self.returnUrl = returnUrl
        self.currency = currency
        self.userAction = userAction
    }
}