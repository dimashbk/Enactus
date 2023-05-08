import UIKit

final class CreditCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
//        let shopViewModel = ShopViewModel()
        let creditController = CreditController()
//        shopController.viewModel = shopViewModel
        navigationController.pushViewController(creditController, animated: true)
    }
}
