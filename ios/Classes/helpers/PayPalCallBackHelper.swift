import PayPalCheckout
import Flutter

class PayPalCallBackHelper {
    public let channel: FlutterMethodChannel

    init(flutterChannel: FlutterMethodChannel) {
        channel = flutterChannel
    }

    public func onApprove(_ approval: Approval) throws {
        approval.actions.capture { (response, error) in
            print("Order successfully captured: \(response?.data)")
        }
        let data = approval.data
        var dataMap: [String: Any?] = [
            "payerId": data.payerID,
            "paymentId": data.paymentID,
            "billingToken": data.billingToken,
            "intent": data.intent.stringValue,
            "returnUrl": [
                "href": data.returnURL?.absoluteString,
            ],
            "description": data.description,
        ]

        if let vault = data.vaultData {
            let vaultMap = [
                "approvalTokenID": vault.approvalTokenID,
                "approvalSessionID": vault.approvalSessionID,
            ]
            dataMap["vaultData"] = vaultMap
        }

        if let buyer = data.buyer {
            let buyerMap = [
                "name": buyer.fullName,
                "email": buyer.email,
                "userId": buyer.userId,
                "imageUrl": buyer.imageURL?.absoluteString,
            ]
            dataMap["buyer"] = buyerMap
        }

        if let cart = data.cart {
            let cartMap: [String: Any?] = [
                "cartId": cart.cartID,
                "intent": cart.intent,
                "billingToken": cart.billingToken,
                "billingType": cart.billingType?.rawValue,
                "cancelUrl": cart.cancelURL?.absoluteString,
                "returnUrl": cart.returnURL?.absoluteString,
                "total": cart.total.toDictionary(),
                "shippingAddress": cart.shippingAddress?.toDictionary(),
                "billingAddress": cart.billingAddress?.toDictionary(),
                "totalAllowedOverCaptureAmount": cart.totalAllowedOverCaptureAmount.toDictionary(),
                "items": cart.items.map({ (item) in
                    var cartItemMap: [String: Any?] = [
                        "name": item.name,
                        "description": item.itemDescription,
                        "quantity": item.quantity,
                    ]
                    cartItemMap["total"] = item.total.toDictionary()
                    cartItemMap["unitPrice"] = item.unitPrice.toDictionary()
                    return cartItemMap
                })
            ]
            dataMap["cart"] = cartMap
        }

        let dataJson = try JSONSerialization.data(withJSONObject: dataMap, options: [])
        let jsonString = String(data: dataJson, encoding: .utf8)!
        let finalResult = ["approvalData": jsonString]
        channel.invokeMethod("FlutterPaypal#onSuccess", arguments: finalResult)
    }

    public func onShippingChange(_ shippingChange: ShippingChange) throws {
        let dataMap: [String: Any?] = [
            "type": shippingChange.type.description,
            "selectedShippingAddress": shippingChange.selectedShippingAddress.toDictionary(),
            "shippingMethods": shippingChange.shippingMethods.map({ (shippingMethod) in
                shippingMethod.toDictionary()
            }),
            "selectedShippingMethod" : shippingChange.selectedShippingMethod?.toDictionary(),
            "payToken": shippingChange.payToken,
            "paymentID": shippingChange.paymentID,
            "billingToken": shippingChange.billingToken,
        ]


        let dataJson = try JSONSerialization.data(withJSONObject: dataMap, options: [])
        let jsonString = String(data: dataJson, encoding: .utf8)!
        let finalResult = ["result": jsonString]
        channel.invokeMethod(" FlutterPaypal#onShippingChange", arguments: finalResult)
    }

    public func onCancel() {
        channel.invokeMethod("FlutterPaypal#onCancel", arguments: nil)
    }

    public func onError(_ error: ErrorInfo) {
        channel.invokeMethod("FlutterPaypal#onError", arguments: error.toDictionary())
    }
}

