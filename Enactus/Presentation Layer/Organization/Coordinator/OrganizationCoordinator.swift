import UIKit

final class OrganizationCoordinator: Coordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let organizationController = OrganizationController()
        navigationController.pushViewController(organizationController, animated: true)
    }
    
}
