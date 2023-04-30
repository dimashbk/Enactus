import UIKit

final class ProfileCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let profileController = ProfileViewController()
        navigationController.pushViewController(profileController, animated: true)
    }
}
