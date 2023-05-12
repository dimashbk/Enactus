import UIKit

final class ENSuccessCoordinator: BaseCoordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(title: String?, subtitle: String?, onBackButtonDidTap: (() -> ())?) {
        let viewModel = ENSuccessViewModel(title: title, subtitle: subtitle, onBackButtonDidTap: onBackButtonDidTap)
        let controller = ENSuccessController()
        controller.modalPresentationStyle = .fullScreen
        controller.viewModel = viewModel
        navigationController.present(controller, animated: true)
    }
}
