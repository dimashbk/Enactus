//
//  CreatePasswordViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 25.04.2023.
//

import Foundation

final class CreatePasswordViewModel {
    
    var coordinatorDelegate: CreatePasswordCoordinatorProtocol?
    
    var statusText = Dynamic("")
    
    func checkIdentity(first: String, second: String) {
        if first == second {
            nextStep(password: first)
        } else {
            statusText.value = "Пароли не совпадают"
        }
    }
    
    private func nextStep(password: String) {
        switch AuthorizationService.shared.authorizationPath {
        case .resetPassword:
            AuthorizationService.shared.authorizationModel.password = password
            AuthorizationService.shared.resetPassword()
            coordinatorDelegate?.showRootFlow()
        case .signUp:
            AuthorizationService.shared.authorizationModel.password = password
            AuthorizationService.shared.register()
            coordinatorDelegate?.showAlert()
        case .signIn:
            print("")
        case .none:
            print("")
        }
    }
    
    
    
    

}
