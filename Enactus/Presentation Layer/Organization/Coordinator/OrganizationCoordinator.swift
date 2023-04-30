import UIKit

final class OrganizationCoordinator: BaseCoordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let organizationController = OrganizationController()
        organizationController.coordinator = self
        navigationController.pushViewController(organizationController, animated: true)
    }
}
