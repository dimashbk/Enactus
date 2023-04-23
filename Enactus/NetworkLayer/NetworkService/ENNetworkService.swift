import Alamofire
import Foundation

protocol ENNetworkServiceProtocol {
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

final class ENNetworkService: ENNetworkServiceProtocol {
    
    let session = URLSession.shared
    let decoder = JSONDecoder()
    
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
    
    func sendRequest<T: Decodable>(url: URL, method: String, headers: [String: String], body: [String: Any]?, completion: @escaping (Result<T, Error>) -> Void) {
        var request = URLRequest(url: url)

        request.httpMethod = method
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
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
