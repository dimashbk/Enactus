import Foundation

protocol WalletViewModelInput {
    var transactions: [TransactionModel] { get set }
    var updateViewData: (() -> ())? { get set }
}

protocol WalletViewModelOutput {
    func getTransactions()
}

protocol PaymentHistoryProtocol{
    func updateStatusText()
    var statusText: Dynamic<Any> { get set }
}

typealias WalletViewModelProtocol = WalletViewModelInput & WalletViewModelOutput & PaymentHistoryProtocol

final class WalletViewModel: WalletViewModelProtocol {
    
    private let networkService: ENNetworkService
    
    var transactions: [TransactionModel] = []
    
    var updateViewData: (() -> ())?
    
    var statusText: Dynamic<Any> = Dynamic("")
    
    init(networkService: ENNetworkService = ENNetworkService()) {
        self.networkService = networkService
    }
    
    func updateStatusText() {
        if transactions.count == 0 {
            statusText.value = "Ваша история платежей пуста"
        } else {
            statusText.value = ""
        }
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
                self.updateStatusText()
                print("All transactions: \(self.transactions)")
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
}
