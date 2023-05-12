import UIKit

final class OrganizationCoordinator: BaseCoordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(model: ENOrganizationModel) {
        let orgsViewModel = OrgsViewModel(model: model)
        orgsViewModel.coordinatorDelegate = self
        let organizationController = OrganizationController(viewModel: orgsViewModel)
        navigationController.pushViewController(organizationController, animated: true)
    }
}
