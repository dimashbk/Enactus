import Foundation

struct CreditConfirmResponse: Codable {
    let message: String
}

protocol ConfirmViewModelProtocol {
    var retake: RetakeElement {get}
    var coordinator: ConfirmCoordinator? {get set}
    func payRetake()
}

final class ConfirmViewModel: ConfirmViewModelProtocol {
    
    var coordinator: ConfirmCoordinator?
    
    var networkService: ENNetworkService
    
    var retake: RetakeElement
    
    init(networkService: ENNetworkService = ENNetworkService(), retake: RetakeElement) {
        self.networkService = networkService
        self.retake = retake
    }
    
    func payRetake() {
        guard let url = URL(string: "http://studc-api.kz/api/retakes/pay/\(retake.id)") else { return }
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)", "Content-Type": "application/json"]
                
        networkService.sendRequestCredit(url: url, method: "POST", headers: headers, body: nil) { (result: Result<CreditConfirmResponse,Error>) in
            switch result {
            case .success(let data):
                print("Response: \(data)")
                DispatchQueue.main.async {
                    self.coordinator?.showSuccessPage()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.coordinator?.showAlert()
                }
                print("Error:", error.localizedDescription)
            }
        }
    }
}
