//
//  WalletCoordinator.swift
//  Enactus
//
//  Created by Dinmukhamed on 01.05.2023.
//
import UIKit

final class WalletCoordinator: BaseCoordinator{
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let walletViewModel = WalletViewModel()
        let walletVC = WalletViewController()
        walletVC.viewModel = walletViewModel
        navigationController.pushViewController(walletVC, animated: true)
    }
}
