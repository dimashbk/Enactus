struct TransactionRequest: Codable {
    var walletID: String
    var amount: Int
    
    enum CodingKeys: String, CodingKey {
        case walletID = "to_wallet_address"
        case amount
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(walletID, forKey: .walletID)
        try container.encode(amount, forKey: .amount)
    }
}
