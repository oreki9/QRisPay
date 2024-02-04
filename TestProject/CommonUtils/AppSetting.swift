//
//  AppSetting.swift
//  TestProject
//
//  Created by rickyTA on 03/02/24.
//

import Foundation
class AppSetting {
    static let shared = AppSetting()
    let kUserDefaults = UserDefaults.standard
    var balance: Double {
        get {
            var result : Double = 0
            if let r = kUserDefaults.value(forKey:"balance") as? Double {
                result = r
            }
            return result
        }
        
        set(_balance){
            kUserDefaults.set(_balance, forKey: "balance")
            kUserDefaults.synchronize()
        }
    }
    var isFirstUseApp: Bool {
        get {
            var result = true
            if let r = kUserDefaults.value(forKey:"isFirstUseApp") as? Bool {
                result = r
            }
            return result
        }
        
        set(_isAfterLogin){
            kUserDefaults.set(_isAfterLogin, forKey: "isFirstUseApp")
            kUserDefaults.synchronize()
        }
    }
    
}
enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case invalidData
}

class APIRequest {
    static let shared = APIRequest()
    private init() {}

    func makeRequest<T: Decodable>(urlString: String, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.invalidData))
            }
        }

        task.resume()
    }
}
