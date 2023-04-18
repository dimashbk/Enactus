import Foundation

struct ENOrganizationModel: Decodable {
    var id: Int
    var title: String
    var title_desc: String
    var salary_amount: String
    var salary_currency_id: Int
    var location: String
    var description: String
    var photo: String
    var email: String
    var created_at: String
    var updated_at: String
    var deleted_at: String? = nil
    var currency: ENOrganizationCurrencyModel
}

struct ENOrganizationCurrencyModel: Decodable {
    var id: Int
    var title: String
    var created_at: String
    var updated_at: String
}
