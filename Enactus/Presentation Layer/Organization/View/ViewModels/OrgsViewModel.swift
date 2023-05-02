import Foundation

protocol OrgsViewModelInput {
    var organization: ENOrganizationModel? { get set }
    var organizationModel: ENOrganizationModel { get set }
}

protocol OrgsViewModelOutput {
    func fetchOrganizationDetails()
}

typealias OrgsViewModelProtocol = OrgsViewModelInput & OrgsViewModelOutput

final class OrgsViewModel: OrgsViewModelProtocol {

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
}


