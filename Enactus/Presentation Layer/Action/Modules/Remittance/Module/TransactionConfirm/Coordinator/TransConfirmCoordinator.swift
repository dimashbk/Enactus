import UIKit

final class TransConfirmCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(walletId: String, amount: Int) {
        let viewModel = TransConfirmViewModel(walletID: walletId, amount: amount)
        let controller = TransConfirmController()
        controller.viewModel = viewModel
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
//        print("walletID: \(walletId), amount: \(amount)")
    }
}
