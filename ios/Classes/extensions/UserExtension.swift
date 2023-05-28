import PayPalCheckout

extension User {
    func toDictionary() -> [String: Any?] {
        let userMap: [String: Any?] = [
            "name": [
                "fullName": fullName,
                "givenName": givenName,
                "familyName": familyName
            ],
            "email": [
                "value": email
            ],
            "userId": userId,
            "imageUrl": imageURL?.absoluteString,
        ]
        return userMap
    }
}
