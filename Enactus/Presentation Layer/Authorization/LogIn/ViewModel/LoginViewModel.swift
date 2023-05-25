//
//  LoginViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 21.04.2023.
//

import Foundation

final class LoginViewModel{
    
   var coordinatorDelegate: LoginCoordinatorProtocol?
    
    func register(email: String) {
        AuthorizationService.shared.authorizationModel.email = email
        AuthorizationService.shared.sendCode()
        self.coordinatorDelegate?.showOTPFlow()
    }
    func moveToSignIn() {
        coordinatorDelegate?.showAlert()
    }
}
