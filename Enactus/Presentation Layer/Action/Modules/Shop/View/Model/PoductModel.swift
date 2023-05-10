import Foundation

struct ENProductModel: Codable {
    var id: Int
    var title: String
    var price: Int
    var currencyId: Int
    var photo: String
    var createdAt: String
    var updatedAt: String
    var deletedAt: String?
    var currency: ENCurrencyModel
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case currencyId = "currency_id"
        case photo
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case currency
    }
}
