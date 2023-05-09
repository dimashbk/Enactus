import UIKit

final class PaymentCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let paymentController = PaymentController()
        navigationController.pushViewController(paymentController, animated: true)
    }
}
