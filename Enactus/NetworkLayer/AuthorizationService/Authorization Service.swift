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
    
    var accessToken: String {
        get{
            if UserDefaults.standard.value(forKey: "accessToken") == nil {
                return ""
            } else {
                return  UserDefaults.standard.value(forKey: "accessToken") as! String
            }
        
        }
        set{
                UserDefaults.standard.set(newValue, forKey: "accessToken")
        }
    }
    
    var correctCode = String()
    
    var authorizationModel = Authorization(email: nil,
                                           code: nil,
                                           password: nil)
    
    func login() {
        networkService.postLogin(param: authorizationModel) { [weak self] result in
            self?.accessToken = result?.token.original.accessToken ?? ""
            self?.getProfileInfo()

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

        }
    }
    func register() {
        networkService.postRegister(param: authorizationModel) { [weak self] result in

        }
    }
    func refreshToken() {
        guard let url = URL(string: "http://studc-api.kz/api/auth/refresh-token") else { return }
        
        var token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)"]
        
        print(token)
        
        networkService.sendRequest(url: url, method: "GET", headers: headers, body: nil) { (result: Result<Login,Error>) in
            switch result {
            case .success(let data):
                print(data.message)
                print(token)
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
    func getProfileInfo() {
        guard let url = URL(string: "http://studc-api.kz/api/auth/profile/get") else { return }
        
        let token = AuthorizationService.shared.accessToken
        
        let headers = ["Authorization": "Bearer \(token)"]
        
        networkService.sendRequest(url: url, method: "GET", headers: headers, body: nil) { (result: Result<Profile,Error>) in
            switch result {
            case .success(let data):
                profileInfo = data
                print(profileInfo)
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
        }
    }
}
