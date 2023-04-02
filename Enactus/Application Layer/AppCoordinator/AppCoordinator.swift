//
//  AppCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 27.03.2023.
//

import Foundation
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
        
        let tabBarCoordinator = SignInCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
}
