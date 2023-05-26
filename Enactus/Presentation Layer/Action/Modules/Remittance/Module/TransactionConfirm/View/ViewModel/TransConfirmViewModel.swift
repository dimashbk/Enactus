import Foundation

protocol TransConfirmViewModelInput {
    var messageText: String {get}
    var walletId: String {get}
    var amount: Int {get}
    var coordinator: TransConfirmCoordinator? {get set}
}

protocol TransConfirmViewModelOutput {
    func createTransaction()
}

typealias TransConfirmViewModelProtocol = TransConfirmViewModelInput & TransConfirmViewModelOutput

final class TransConfirmViewModel: TransConfirmViewModelProtocol {
    private let networkService: ENNetworkService
    
    var coordinator: TransConfirmCoordinator?
    
    var messageText: String
    
    var walletId: String
    
    var amount: Int
    
    init(networkService: ENNetworkService = ENNetworkService(), messageText: String, walletID: String, amount: Int) {
        self.messageText = messageText
        self.walletId = walletID
        self.amount = amount
        self.networkService = networkService
    }
}

extension TransConfirmViewModel {
    func createTransaction() {
        guard let url = URL(string: "http://studc-api.kz/api/transactions/create") else { return }
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)", "Content-Type": "application/json"]
        
        let patchBody = TransactionRequest(messageText: self.messageText, walletID: self.walletId, amount: self.amount)
        
        do {
            let encoder = JSONEncoder()
            let body = try encoder.encode(patchBody)
            
            networkService.sendRequest(url: url, method: "POST", headers: headers, body: body) { (result: Result<TransactionConfirmResponse,Error>) in
                switch result {
                case .success(let data):
                    print("Response: \(data)")
                    DispatchQueue.main.async {
                        AuthorizationService.shared.getProfileInfo()
                        self.coordinator?.showSuccessPage()
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.coordinator?.showAlert()
                    }
                    print("Error:", error.localizedDescription)
                }
            }
        } catch {
            print("error")
        }
    }
}
