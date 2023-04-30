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
}


