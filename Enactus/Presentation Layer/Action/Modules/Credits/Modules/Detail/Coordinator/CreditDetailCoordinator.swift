import UIKit

final class CreditDetailCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let creditDetailController = CreditDetailController()
        creditDetailController.coordinator = self
        navigationController.pushViewController(creditDetailController, animated: true)
    }
    
    func showPaymentFlow() {
        let paymentCoordinator = PaymentCoordinator(navigationController: navigationController)
        coordinate(to: paymentCoordinator)
    }
}
