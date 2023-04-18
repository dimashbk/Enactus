//
//  AppCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
<<<<<<< dimash
        let mainCoordinator = OnboardingCoordinator(navigationController: navigationController)
        coordinate(to: mainCoordinator)
=======
        if UserDefaults.standard.bool(forKey: "usersSecondLaunch") == true {
            let tabBarCoordinator = SignInCoordinator(navigationController: navigationController)
            coordinate(to: tabBarCoordinator)
        } else {
            let tabBarCoordinator = OnboardingCoordinator(navigationController: navigationController)
            coordinate(to: tabBarCoordinator)
            UserDefaults.standard.set(true, forKey: "usersSecondLaunch")
        }
>>>>>>> main
    }
}
