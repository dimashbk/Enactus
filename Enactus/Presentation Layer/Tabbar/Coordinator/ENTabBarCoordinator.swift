import UIKit

class ENTabBarCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBar =  ENTabBarController()
        navigationController.pushViewController(tabBar, animated: true)
    }
}
