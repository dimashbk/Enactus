import Foundation

struct ProductResponse: Codable {
    var data: [ENProductModel]
}

protocol ShopViewModelInput {
    var products: [ENProductModel] { get set }
    var updateViewData: (() -> ())? {get set}
    var coordinator: ShopCoordinator? {get set}
}

protocol ShopViewModelOutput {
    func fetchProducts()
    func showAlertView()
}

typealias ShopViewModelProtocol = ShopViewModelInput & ShopViewModelOutput

final class ShopViewModel: ShopViewModelProtocol {
    var products: [ENProductModel] = []

    var updateViewData: (() -> ())?
    
    private let networkService: ENNetworkService
    
    var coordinator: ShopCoordinator?
    
    init(networkService: ENNetworkService = ENNetworkService()) {
        self.networkService = networkService
    }
}

extension ShopViewModel {
    func fetchProducts() {
        guard let url = URL(string: "http://studc-api.kz/api/products/get-all") else {return}
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)"]
        
        networkService.sendRequest(url: url, method: "GET", headers: headers, body: nil) { (result: Result<ProductResponse,Error>) in
            switch result {
            case .success(let data):
                self.products = data.data
                self.updateViewData?()
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
    
    func showAlertView() {
        coordinator?.showAlert()
    }
}


