import UIKit

final class PaymentCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let paymentController = PaymentController()
        paymentController.coordinator = self
        navigationController.pushViewController(paymentController, animated: true)
    }
    
    func showConfirmFlow(text: String) {
        let confirmCoordinator = ConfirmCoordinator(navigationController: navigationController)
        confirmCoordinator.start(text: text)
        print(text)
    }
}
