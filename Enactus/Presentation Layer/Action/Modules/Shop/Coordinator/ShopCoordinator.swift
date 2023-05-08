import UIKit

final class ShopCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let shopViewModel = ShopViewModel()
        let shopController = ShopController()
        shopController.viewModel = shopViewModel
        navigationController.pushViewController(shopController, animated: true)
    }
}
