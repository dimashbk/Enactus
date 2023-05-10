import UIKit

final class ScheduleCoordinator: BaseCoordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    override func start() {
        let scheduleController = ScheduleViewController()
        scheduleController.viewModel = ScheduleViewModel()
        navigationController.pushViewController(scheduleController, animated: true)
    }
}
