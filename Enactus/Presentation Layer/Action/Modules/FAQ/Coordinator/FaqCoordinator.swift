import UIKit

final class FaqCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewModel = QuestionViewModel()
        let controller = FaqController()
        controller.viewModel = viewModel
        navigationController.pushViewController(controller, animated: true)
    }
}
