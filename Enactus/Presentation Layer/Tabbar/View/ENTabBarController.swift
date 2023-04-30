import UIKit

final class ENTabBarController: UITabBarController {
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
        
        view.backgroundColor = .white
    }
    
    //MARK: - Methods
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: MainViewController(),
                       title: "Главная",
                       image: UIImage(named: "main")),
            generateVC(viewController: ScheduleViewController(),
                       title: "Расписание",
                       image: UIImage(named: "schedule")),
            generateVC(viewController: ProfileViewController(),
                       title: "Профиль",
                       image: UIImage(named: "profile"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        let navController = UINavigationController(rootViewController: viewController)
        return navController
    }
    
    private func setTabBarAppearance() {
        tabBar.backgroundColor = .white
    }
}
