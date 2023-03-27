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
    private var appCoordinate: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        setCoordinator()
        
        return true

    }
    private func setCoordinator() {
        appCoordinate = AppCoordinator(window: window!)
        appCoordinate?.start()
        
    }


}

