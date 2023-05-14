struct TransactionModel: Codable {
    var id: Int
    let messageText: String
    var fromUser: Int
    var toUser: Int
    var txHash: String
    var amount: Int
    let status: Int
    var createdAt: String
    var updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case messageText = "message_text"
        case fromUser = "from_user_id"
        case toUser = "to_user_id"
        case txHash
        case amount
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct TransactionResponse: Codable {
    var fromTransactions: [TransactionModel]
    var toTransactions: [TransactionModel]
    
    enum CodingKeys: String, CodingKey {
        case fromTransactions = "from_transactions"
        case toTransactions = "to_transactions"
    }
}
