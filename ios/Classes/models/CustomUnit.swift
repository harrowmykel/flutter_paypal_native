import UIKit

class CustomUnit: Codable {
    let referenceId: String
    let price: String
    let currency: String

    init(referenceId: String, price: String, currency: String) {
        self.referenceId = referenceId
        self.price = price
        self.currency = currency
    }
}