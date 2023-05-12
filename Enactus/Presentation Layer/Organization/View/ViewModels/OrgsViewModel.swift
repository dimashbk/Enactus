import Foundation

struct ApplyResponse: Codable {
    var message: String
}

protocol OrgsViewModelInput {
    var organization: ENOrganizationModel? { get set }
    var organizationModel: ENOrganizationModel { get set }
    var isApplied: Bool { get set }
}

protocol OrgsViewModelOutput {
    func fetchOrganizationDetails()
    func applyToPayment()
}

typealias OrgsViewModelProtocol = OrgsViewModelInput & OrgsViewModelOutput

final class OrgsViewModel: OrgsViewModelProtocol {
    var isApplied: Bool = false
    
    var coordinatorDelegate: OrganizationCoordinator?

    private let networkService: ENNetworkService
    
    weak var coordinator: OrganizationCoordinator?
    
    var organization: ENOrganizationModel?
    
    var organizationModel: ENOrganizationModel
    
    init(networkService: ENNetworkService = ENNetworkService(), model: ENOrganizationModel) {
        self.networkService = networkService
        self.organizationModel = model
    }
}

extension OrgsViewModel {
    
    func fetchOrganizationDetails() {
        guard let url = URL(string: "http://studc-api.kz/api/orgs/get-by-id/\(self.organizationModel.id)") else {return}
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)"]
        
        networkService.sendRequest(url: url, method: "GET", headers: headers, body: nil) { (result: Result<[ENOrganizationModel],Error>) in
            switch result {
            case .success(let data):
                self.organization = data.first
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
    
    func applyToPayment() {
        guard let url = URL(string: "http://studc-api.kz/api/orgs/payments/apply-to-payment/\(self.organizationModel.id)") else {return}
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)"]
        
        networkService.sendRequest(url: url, method: "GET", headers: headers, body: nil) { (result: Result<ApplyResponse,Error>) in
            switch result {
            case .success(let data):
                self.isApplied = true
            case .failure(let error):
                self.isApplied = false
                print("Error:", error.localizedDescription)
            }
        }
    }
}


