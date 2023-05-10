import Foundation

protocol TransConfirmViewModelInput {
    var walletId: String {get}
    var amount: Int {get}
}

protocol TransConfirmViewModelOutput {
    func createTransaction()
}

typealias TransConfirmViewModelProtocol = TransConfirmViewModelInput & TransConfirmViewModelOutput

final class TransConfirmViewModel: TransConfirmViewModelProtocol {
    private let networkService: ENNetworkService
    
    var walletId: String
    
    var amount: Int
    
    init(networkService: ENNetworkService = ENNetworkService(), walletID: String, amount: Int) {
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
        
        let patchBody = TransactionRequest(walletID: self.walletId, amount: self.amount)
        
        do {
            let encoder = JSONEncoder()
            let body = try encoder.encode(patchBody)
            
            networkService.sendRequest(url: url, method: "POST", headers: headers, body: body) { (result: Result<TransactionConfirmResponse,Error>) in
                switch result {
                case .success(let data):
                    print("Response: \(data)")
                case .failure(let error):
                    print("Error:", error.localizedDescription)
                }
            }
        } catch {
            print("error")
        }
        
        
    }
}