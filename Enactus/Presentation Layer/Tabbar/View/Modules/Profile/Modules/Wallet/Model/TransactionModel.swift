struct TransactionModel: Codable {
    var id: Int
    var fromUser: Int
    var toUser: Int
    var txHash: String
    var amount: Int
    var status: Int
    var createdAt: String
    var updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case fromUser = "from_user_id"
        case toUser = "to_user_id"
        case txHash
        case amount
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
