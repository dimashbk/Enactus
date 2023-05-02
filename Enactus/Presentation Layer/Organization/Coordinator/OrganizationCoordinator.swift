import UIKit

final class OrganizationCoordinator: BaseCoordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(model: ENOrganizationModel) {
        let orgsViewModel = OrgsViewModel(model: model)
        let organizationController = OrganizationController(viewModel: orgsViewModel)
        organizationController.coordinator = self
        navigationController.pushViewController(organizationController, animated: true)
    }
}
