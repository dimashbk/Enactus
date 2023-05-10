struct TransactionResponse: Codable {
    var fromTransactions: [TransactionModel]
    var toTransactions: [TransactionModel]
    
    enum CodingKeys: String, CodingKey {
        case fromTransactions = "from_transactions"
        case toTransactions = "to_transactions"
    }
}
