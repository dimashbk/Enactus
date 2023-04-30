import UIKit

final class ENTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    //MARK: - Properties
    var coordinatorDelegate: ENTabBarCoordinator?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarAppearance()
    }
    
    //MARK: - Methods
    private func setTabBarAppearance() {
        tabBar.backgroundColor = .white
        view.backgroundColor = .white
    }
}
