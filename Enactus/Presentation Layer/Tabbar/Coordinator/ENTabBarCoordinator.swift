import UIKit

class ENTabBarCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    
    private let mainVC = UINavigationController()
    private let scheduleVC = UINavigationController()
    private let profileVC = UINavigationController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let tabBar = makeTabBar()
        navigationController.present(tabBar, animated: true)
    }
    
    private func makeTabBar() -> UITabBarController {
        let tabBar =  ENTabBarController()
        tabBar.modalTransitionStyle = .crossDissolve
        tabBar.modalPresentationStyle = .fullScreen
        tabBar.coordinatorDelegate = self
        
        mainVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "main"), tag: 0)
        scheduleVC.tabBarItem = UITabBarItem(title: "Расписание", image: UIImage(named: "schedule"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "profile"), tag: 2)
        
        tabBar.viewControllers = [mainVC, scheduleVC, profileVC]
        
        let mainCoordinator = MainCoordinator(navigationController: mainVC)
        let scheduleCoordinator = ScheduleCoordinator(navigationController: scheduleVC)
        let profileCoordinator = ProfileCoordinator(navigationController: profileVC)
        
        [mainCoordinator, scheduleCoordinator, profileCoordinator].forEach {
            coordinate(to: $0)
        }
        
        return tabBar
    }
}
