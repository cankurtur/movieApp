//
//  Networking.swift
//  movieApp
//
//  Created by Can Kurtur on 3.09.2021.
//

import Foundation
import Alamofire

class Networking {
    func performRequest<T: Codable>(url: String, completion: @escaping((Result<T, Error>) -> Void)) {
        let url = url
        AF.request(url, method: .get).validate().response { responseData in
            if responseData.error != nil {
                print(responseData.error)
            } else {
                do {
                    guard let data = responseData.data else { return }
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(Result.success(object))
                } catch {
                    completion(Result.failure(error))
                }
            }
        }
    }
}
