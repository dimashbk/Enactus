import UIKit

final class MainCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewModel = MainViewModel()
        let mainController = MainViewController(viewModel: viewModel)
        mainController.coordinator = self
        navigationController.pushViewController(mainController, animated: true)
    }
    
    func showOrgDetailFlow() {
        let organizationCoordinator = OrganizationCoordinator(navigationController: navigationController)
        coordinate(to: organizationCoordinator)
    }
}
