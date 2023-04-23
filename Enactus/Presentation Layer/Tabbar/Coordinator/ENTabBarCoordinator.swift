import UIKit

class ENTabBarCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let tabBar =  ENTabBarController()
        navigationController.pushViewController(tabBar, animated: true)
    }
}
