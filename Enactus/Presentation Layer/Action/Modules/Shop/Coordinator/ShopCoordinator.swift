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
        shopController.viewModel?.coordinator = self
        navigationController.pushViewController(shopController, animated: true)
    }
    
    func showAlert() {
        let alert = CustomAlertController()
        navigationController.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.navigationController.dismiss(animated: true)
        })
    }
}
