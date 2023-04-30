//
//  Authorization Service.swift
//  Enactus
//
//  Created by Dinmukhamed on 23.04.2023.
//

import Foundation

enum AuthorizationPath {
    case signIn
    case signUp
    case resetPassword
    case none
}

final class AuthorizationService {
    
    static let shared = AuthorizationService()
    
    let networkService = ENNetworkService()
    
    var authorizationPath: AuthorizationPath = .none
    
    var accessToken = String()
    
    var correctCode = String()
    
    var authorizationModel = Authorization(email: nil,
                                           code: nil,
                                           password: nil)
    
    func login() {
        networkService.postLogin(param: authorizationModel) { [weak self] result in
            self?.accessToken = result?.token.original.accessToken ?? ""
        }
    }
    
    func sendCode() {
        networkService.sendCode(param: authorizationModel.email) { [weak self] result in
            self?.correctCode = result?.code.code ?? ""
            print(self?.correctCode)
        }
    }
    func resetPassword() {
        networkService.resetPassword(param: authorizationModel) { [weak self] result in
            print(result)
        }
    }
    func register() {
        networkService.postRegister(param: authorizationModel) { [weak self] result in
            print(result)
        }
    }
}
