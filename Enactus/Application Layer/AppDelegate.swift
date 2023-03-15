//
//  AppDelegate.swift
//  Enactus
//
//  Created by Dinmukhamed on 14.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = UINavigationController(rootViewController: OnboardingViewController())
        
        window?.makeKeyAndVisible()
        
        return true

    }


}

