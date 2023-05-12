import UIKit

final class ENSuccessCoordinator: BaseCoordinator {

    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewModel = ENSuccessViewModel(title: "Ваша заявка принята!", subtitle: "В скором времени организация рассмотрит вашу позицию", onBackButtonDidTap: {})
        let controller = ENSuccessController()
        controller.viewModel = viewModel
        navigationController.pushViewController(controller, animated: true)
    }
}
