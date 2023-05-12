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
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white

        if AuthorizationService.shared.accessToken.count < 1 {
            let mainCoordinator = SignInCoordinator(navigationController: navigationController)
            coordinate(to: mainCoordinator)
        } else {
            AuthorizationService.shared.refreshToken()
            let mainCoordinator = ENTabBarCoordinator(navigationController: navigationController)
            coordinate(to: mainCoordinator)
        }

        
    }
}
