import PayPalCheckout
import Flutter

class PayPalCallBackHelper {
    public let channel: FlutterMethodChannel

    init(flutterChannel: FlutterMethodChannel) {
        channel = flutterChannel
    }

    public func onApprove(_ approval: Approval) throws {
        approval.actions.capture { (response, error) in
            //print("")
            print("Order successfully captured: \(response?.data)")
        }
        let data = approval.data
        var dataMap: [String: Any?] = data.toDictionary()

        let dataJson = try JSONSerialization.data(withJSONObject: dataMap, options: [])
        let jsonString = String(data: dataJson, encoding: .utf8)!
        let finalResult = ["approvalData": jsonString]
        channel.invokeMethod("FlutterPaypal#onSuccess", arguments: finalResult)
    }

    public func onShippingChange(_ shippingChange: ShippingChange) throws {
        let dataMap: [String: Any?] = shippingChange.toDictionary()
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

