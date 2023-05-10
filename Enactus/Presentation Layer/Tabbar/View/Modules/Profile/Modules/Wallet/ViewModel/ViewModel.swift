import Foundation

protocol WalletViewModelInput {
    var transactions: [TransactionModel] { get set }
    var updateViewData: (() -> ())? { get set }
}

protocol WalletViewModelOutput {
    func getTransactions()
}

typealias WalletViewModelProtocol = WalletViewModelInput & WalletViewModelOutput

final class WalletViewModel: WalletViewModelProtocol {
    
    private let networkService: ENNetworkService
    
    var transactions: [TransactionModel] = []
    
    var updateViewData: (() -> ())?
    
    init(networkService: ENNetworkService = ENNetworkService()) {
        self.networkService = networkService
    }
    
}

extension WalletViewModel {
    func getTransactions() {
        guard let url = URL(string: "http://studc-api.kz/api/transactions/get-all") else {return}
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)"]
        
        networkService.sendRequest(url: url, method: "GET", headers: headers, body: nil) { (result: Result<TransactionResponse,Error>) in
            switch result {
            case .success(let data):
                data.fromTransactions.forEach {
                    self.transactions.append($0)
                }
                data.toTransactions.forEach {
                    self.transactions.append($0)
                }
                self.updateViewData?()
                print("All transactions: \(self.transactions)")
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
}
