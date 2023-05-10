import Alamofire
import Foundation

protocol ENNetworkServiceProtocol {
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

final class ENNetworkService: ENNetworkServiceProtocol {
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
    func postLogin(param: Authorization, comp: @escaping ((Login?) -> ())) {
        guard let email = param.email,
              let code = param.code,
              let password = param.password else {
            return
        }
        
        let param = [
            "email": email,
            "code": code,
            "password": password
        ] as [String : Any]
    
        AF.request("http://studc-api.kz/api/auth/login",
                   method: .post,
                   parameters: param,
                   encoding: URLEncoding.default).response { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else {
                        print("nosir")
                        return
                    }
                    print("yessir")
                   let result = try JSONDecoder().decode(Login.self, from: data)
                    comp(result)
                } catch {
                    comp(nil)
                }
            case .failure(let error):
               debugPrint(error)
            }
        }
    }
    
    func resetPassword(param: Authorization, comp: @escaping ((ResetPassword?) -> ())) {
        guard let email = param.email,
              let code = param.code,
              let password = param.password else {
            return
        }
        
        let param = [
            "email": email,
            "code": code,
            "password": password
        ] as [String : Any]
        
        AF.request("http://studc-api.kz/api/auth/reset-password",
                   method: .post,
                   parameters: param,
                   encoding: URLEncoding.default).response { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else {
                        print("nosir")
                        return
                    }
                    print("yessir")
                   let result = try JSONDecoder().decode(ResetPassword.self, from: data)
                    comp(result)
                } catch {
                    comp(nil)
                }
            case .failure(let error):
               debugPrint(error)
            }
        }
    }
    func sendCode(param: String?, comp: @escaping ((SendCodeResponse?) -> ())) {
        
        guard let email = param else { return }
        
        let param = [ "email": email ] as [String : Any]
        
        AF.request("http://studc-api.kz/api/auth/send-code",
                   method: .post,
                   parameters: param,
                   encoding: URLEncoding.default).response { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else {
                        print("nosir")
                        return
                    }
                    print("yessir")
                   let result = try JSONDecoder().decode(SendCodeResponse.self, from: data)
                    comp(result)
                } catch {
                    comp(nil)
                }
            case .failure(let error):
               debugPrint(error)
            }
        }
    }
    func postRegister(param: Authorization, comp: @escaping ((RegisterResponse?) -> ())) {
        guard let email = param.email,
              let code = param.code,
              let password = param.password else {
            return
        }
        
        let param = [
            "email": email,
            "code": code,
            "password": password
        ] as [String : Any]
        
        AF.request("http://studc-api.kz/api/auth/register",
                   method: .post,
                   parameters: param,
                   encoding: URLEncoding.default).response { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else {
                        print("nosir")
                        return
                    }
                    print("yessir")
                   let result = try JSONDecoder().decode(RegisterResponse.self, from: data)
                    comp(result)
                } catch {
                    comp(nil)
                }
            case .failure(let error):
               debugPrint(error)
            }
        }
    }
    
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            do {
                let decodedData = try self.decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func sendRequest<T: Decodable>(url: URL, method: String, headers: [String: String], body: Data? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: url)

        request.httpMethod = method
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            print(response)
            guard let data = data else {
                completion(.failure(NSError(domain: "NetworkManager", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            do {
                let decodableData = try self.decoder.decode(T.self, from: data)
                completion(.success(decodableData))
            }
            catch let error {
                completion(.failure(error))
            }
           
        }
        
        task.resume()
    }
}
