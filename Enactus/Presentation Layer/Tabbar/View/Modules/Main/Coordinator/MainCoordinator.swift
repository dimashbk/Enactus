import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainController = MainViewController()
        navigationController.pushViewController(mainController, animated: true)
    }
}
