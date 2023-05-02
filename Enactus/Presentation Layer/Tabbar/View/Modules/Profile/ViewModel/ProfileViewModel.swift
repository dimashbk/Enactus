//
//  ProfileViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 28.04.2023.
//

import Foundation

final class ProfileViewModel {
    
    var coordinatorDelegate: ProfileCoordinatorProtocol?
    
    var networkService = ENNetworkService()
    
    var profileInfo: Profile {
        get{
            if let data = UserDefaults.standard.value(forKey: "ProfileInfo") as? Data{
                return try! PropertyListDecoder().decode(Profile.self, from: data)
            }
            else{
                return .init(id: 0, name: nil, surname: nil, patronymic: nil, birthday: nil, group: nil, walletAddress: "")
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue)
            {
                UserDefaults.standard.set(data, forKey: "ProfileInfo")
            }
        }
    }
    
    func moveToNotification() {
        coordinatorDelegate?.showNotificationFlow()
    }
    
    func moveToWallet() {
        coordinatorDelegate?.showWalletFlow()
    }
    
    func moveToEdit() {
        coordinatorDelegate?.showEditFlow()
    }

}
