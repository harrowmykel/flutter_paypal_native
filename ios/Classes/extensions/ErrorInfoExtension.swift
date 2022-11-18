import PayPalCheckout

extension ErrorInfo {
    func toDictionary() -> [String: Any?] {
        var data: [String:Any?] = [
            "reason": reason,
            "payToken": payToken,
            "nativeSdkVersion": nativeSdkVersion,
        ]
        data = data.merging(correlationIDs.toDictionary(), uniquingKeysWith: { (first, _) in first })
        return data
    }
}