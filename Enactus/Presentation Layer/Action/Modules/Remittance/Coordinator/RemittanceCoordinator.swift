import UIKit

final class RemittanceCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let controller = RemittanceController()
        navigationController.pushViewController(controller, animated: true)
    }
}
