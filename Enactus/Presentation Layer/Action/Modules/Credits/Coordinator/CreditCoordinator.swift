import UIKit

final class CreditCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let creditController = CreditController()
        creditController.mainCoordinator = self
        navigationController.pushViewController(creditController, animated: true)
    }
    
    public func showDetailFlow(retake: RetakeElement) {
        let detailCoordinator = CreditDetailCoordinator(navigationController: navigationController)
        detailCoordinator.start(retake: retake)
    }
}
