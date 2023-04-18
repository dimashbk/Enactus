import Foundation

struct ENOrganizationModel: Codable {
    var id: Int
    var title: String
    var titleDesc: String
    var salaryAmount: String
    var salaryCurrencyId: Int
    var location: String
    var description: String
    var photo: String
    var email: String
    var createdAt: String
    var updatedAt: String
    var deletedAt: String?
    var currency: ENOrganizationCurrencyModel
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case titleDesc = "title_desc"
        case salaryAmount = "salary_amount"
        case salaryCurrencyId = "salary_currency_id"
        case location
        case description
        case photo
        case email
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case currency
    }
}

struct ENOrganizationCurrencyModel: Codable {
    var id: Int
    var title: String
    var createdAt: String
    var updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
