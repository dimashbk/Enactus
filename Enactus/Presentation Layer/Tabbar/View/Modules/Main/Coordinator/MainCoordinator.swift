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
}

extension MainCoordinator {
    func showOrgDetailFlow(model: ENOrganizationModel) {
        let organizationCoordinator = OrganizationCoordinator(navigationController: navigationController)
        organizationCoordinator.start(model: model)
    }
    
    func showRemittanceFlow() {
        let remittanceCoordinator = RemittanceCoordinator(navigationController: navigationController)
        store(coordinator: remittanceCoordinator)
        coordinate(to: remittanceCoordinator)
    }
    
    func showShopFlow() {
        let shopCoordinator = ShopCoordinator(navigationController: navigationController)
        store(coordinator: shopCoordinator)
        coordinate(to: shopCoordinator)
    }
    
    func showCreditlow() {
        let creditCoordinator = CreditCoordinator(navigationController: navigationController)
        store(coordinator: creditCoordinator)
        coordinate(to: creditCoordinator)
    }
}
