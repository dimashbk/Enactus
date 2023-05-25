import UIKit

final class RemittanceCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let controller = RemittanceController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    public func showTransactionConfirmFlow(messageText: String, walletId: String, amount: Int) {
        let transConfirmCoordinator = TransConfirmCoordinator(navigationController: navigationController)
        store(coordinator: transConfirmCoordinator)
        transConfirmCoordinator.start(messageText: messageText,walletId: walletId, amount: amount)
    }
}
