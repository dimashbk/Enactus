//
//  NotificationsCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 30.04.2023.
//

import UIKit

final class NotificationCoordinator: BaseCoordinator{
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let notificationVC = NotificationViewController()
        navigationController.pushViewController(notificationVC, animated: true)
    }
}
