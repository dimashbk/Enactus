//
//  EditViewModel.swift
//  Enactus
//
//  Created by Dinmukhamed on 02.05.2023.
//

import Foundation

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

final class EditProfileViewModel {
    
    let networkService = ENNetworkService()
    
    func updateInfo(user: UpdatedUser) {
        
        guard let url = URL(string: "http://studc-api.kz/api/auth/profile/update") else { return }
        
        let token = AuthorizationService.shared.accessToken
        print(token)
        let headers = [
            "Authorization": "Bearer \(token)",
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        do {
            let encoder = JSONEncoder()
            let body = try encoder.encode(user)
            networkService.sendRequest(url: url, method: "PATCH", headers: headers, body: body) { (result: Result<ResetPassword,Error>) in
                switch result {
                case .success(let data):
                    print("Response: \(data)")
                case .failure(let error):
                    print("Error:", error.localizedDescription)
                }
            }
        } catch {
            print("error")
        }
        
    }
}
