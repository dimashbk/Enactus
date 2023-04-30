import UIKit

final class ScheduleCoordinator: BaseCoordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let scheduleController = ScheduleViewController()
        navigationController.pushViewController(scheduleController, animated: true)
    }
}
