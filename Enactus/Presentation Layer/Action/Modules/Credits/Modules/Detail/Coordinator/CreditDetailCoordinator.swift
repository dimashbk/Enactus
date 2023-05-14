import UIKit

final class CreditDetailCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(retake: RetakeElement) {
        let creditDetailController = CreditDetailController()
        creditDetailController.coordinator = self
        creditDetailController.retake = retake
        navigationController.pushViewController(creditDetailController, animated: true)
    }
    
    func showPaymentFlow() {
        let paymentCoordinator = PaymentCoordinator(navigationController: navigationController)
        coordinate(to: paymentCoordinator)
    }
    
    func showConfirmFlow(retake: RetakeElement) {
        let confirmCoordinator = ConfirmCoordinator(navigationController: navigationController)
        confirmCoordinator.start(retake: retake)
    }
}
