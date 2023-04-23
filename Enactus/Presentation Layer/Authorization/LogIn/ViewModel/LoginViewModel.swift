//
//  LoginViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 21.04.2023.
//

import Foundation

final class LoginViewModel{
    
   var coordinatorDelegate: LoginCoordinatorProtocol?
    
    func moveToOTP() {
        self.coordinatorDelegate?.showOTPFlow()
    }
    func moveToSignIn() {
        coordinatorDelegate?.showSigninFlow()
    }
}
