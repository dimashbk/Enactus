//
//  ProfileViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

final class ProfileViewModel {
    
    var coordinatorDelegate: ProfileCoordinatorProtocol?
    
    func moveToNotification() {
        coordinatorDelegate?.showNotificationFlow()
    }
    
    func moveToWallet() {
        coordinatorDelegate?.showWalletFlow()
    }
     
}
