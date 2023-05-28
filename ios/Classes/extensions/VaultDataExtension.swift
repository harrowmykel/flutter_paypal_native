import PayPalCheckout

extension VaultData {
    func toDictionary() -> [String: Any?] {
        let map: [String: Any?] = [   
            "approvalTokenID": approvalTokenID,
            "approvalSessionID": approvalSessionID,
        ]
        return map
    }
}