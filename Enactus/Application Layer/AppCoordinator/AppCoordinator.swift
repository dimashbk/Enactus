//
//  AppCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.backgroundColor = .enBlack
        window?.makeKeyAndVisible()

        if AuthorizationService.shared.accessToken.count < 1 {
            if UserDefaults.standard.bool(forKey: "firstLaunch") == true {
                let mainCoordinator = SignInCoordinator(navigationController: navigationController)
                coordinate(to: mainCoordinator)
                UserDefaults.standard.set(true, forKey: "firstLaunch")
            } else {
                let mainCoordinator = OnboardingCoordinator(navigationController: navigationController)
                coordinate(to: mainCoordinator)
                UserDefaults.standard.set(true, forKey: "firstLaunch")
            }
        } else {
            AuthorizationService.shared.refreshToken()
//            AuthorizationService.shared.getRetakes()
            let mainCoordinator = ENTabBarCoordinator(navigationController: navigationController)
            coordinate(to: mainCoordinator)
        }

        
    }
}
