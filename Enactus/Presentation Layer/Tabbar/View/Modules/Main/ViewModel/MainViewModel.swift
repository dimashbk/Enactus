import Foundation

protocol MainViewModelImput {
    var organizations: [ENOrganizationModel] { get set }
    var updateViewData: (() -> ())? {get set}
    var onOrganizationDidTap: (() -> ())? {get set}
    
}

protocol MainViewModelOutput {
    func fetchOrganizationsList()
    func sendRequest()
}

typealias MainViewModelProtocol = MainViewModelImput & MainViewModelOutput

final class MainViewModel: MainViewModelProtocol {
    private let networkService: ENNetworkService
    
    weak var coordinator: MainCoordinator?
    
    var updateViewData: (() -> ())?
    
    var onOrganizationDidTap: (() -> ())?
    
    var organizations = [ENOrganizationModel]()
    
    init(networkService: ENNetworkService = ENNetworkService()) {
        self.networkService = networkService
    }
}

extension MainViewModel {
    func fetchOrganizationsList() {
        guard let url = URL(string: "http://studc-api.kz/api/orgs/get-all") else {return}
        
        networkService.fetchData(url: url) { (result: Result<[ENOrganizationModel], Error>) in
            switch result {
            case .success(let organizations):
                self.organizations = organizations
                self.updateViewData?()
                print("yeah body: \(organizations)")
            case .failure(let error):
                print("skinny bitch: \(error.localizedDescription)")
            }
        }
    }
    
    func sendRequest() {
        guard let url = URL(string: "http://studc-api.kz/api/orgs/get-by-id/1") else {return}
        
        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vc3R1ZGMtYXBpLmt6L2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjgyMjg0ODA3LCJleHAiOjE2ODIyODg0MDcsIm5iZiI6MTY4MjI4NDgwNywianRpIjoibFliTUVVMEswU2R3bWdTZCIsInN1YiI6IjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.JCly2WFxzJQhazUMLQ_pIWoXkQPKCE45wBr8OGn1P4U"
        
        let headers = ["Authorization": "Bearer \(token)"]
        
        networkService.sendRequest(url: url, method: "GET", headers: headers, body: nil) { (result: Result<[ENOrganizationModel],Error>) in
            switch result {
            case .success(let data):
                print("Response: \(data)")
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
}


