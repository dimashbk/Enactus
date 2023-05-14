import UIKit

final class OrganizationCoordinator: BaseCoordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(model: ENOrganizationModel) {
        let orgsViewModel = OrgsViewModel(model: model)
        let organizationController = OrganizationController()
        organizationController.orgsViewModel = orgsViewModel
        organizationController.orgsViewModel?.coordinatorDelegate = self
        navigationController.pushViewController(organizationController, animated: true)
    }
    
    func showSuccessPage() {
        let coordinator = ENSuccessCoordinator(navigationController: navigationController)
        coordinator.start(title: "Ваша заявка принята!", subtitle: "В скором времени организация рассмотрит вашу позицию", onBackButtonDidTap: {
            DispatchQueue.main.async {
                let controllers = self.navigationController.viewControllers
                for vc in controllers {
                    if vc is MainViewController {
                        _ = self.navigationController.dismiss(animated: true)
                        _ = self.navigationController.popToViewController(vc, animated: true)
                    }
                }
            }
        })
    }
}
