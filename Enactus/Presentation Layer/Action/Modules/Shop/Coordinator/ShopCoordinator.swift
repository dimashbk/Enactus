import UIKit

final class ShopCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let shopController = ShopController()
        navigationController.pushViewController(shopController, animated: true)
    }
}
