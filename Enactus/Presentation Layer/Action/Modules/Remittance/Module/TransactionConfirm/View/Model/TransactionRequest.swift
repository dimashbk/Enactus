struct TransactionRequest: Codable {
    var messageText: String
    var walletID: String
    var amount: Int
    
    enum CodingKeys: String, CodingKey {
        case messageText = "message_text"
        case walletID = "to_wallet_address"
        case amount
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(messageText, forKey: .messageText)
        try container.encode(walletID, forKey: .walletID)
        try container.encode(amount, forKey: .amount)
    }
}
