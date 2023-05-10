import UIKit

final class ConfirmCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(text: String) {
        let viewModel = ConfirmViewModel(text: text)
        let confirmController = ConfirmController()
        confirmController.coordinator = self
        confirmController.viewModel = viewModel
        navigationController.pushViewController(confirmController, animated: true)
    }
    
    func goToCreditsController() {
        
    }
}
