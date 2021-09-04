//
//  Networking.swift
//  movieApp
//
//  Created by Can Kurtur on 3.09.2021.
//

import Foundation
import Alamofire

class Networking {
    func performRequest(completion: @escaping(PopularMoviesResponseModel) -> Void) {
        let url = "\(APIConstants.baseURL)api_key=\(APIConstants.apiKey)&language=en-US&page=1"
        AF.request(url, method: .get).validate().response { responseData in
            if responseData.error != nil {
                print(responseData.error)
            } else {
                guard let data = responseData.data else { return }

                guard let popularMovies = self.parseJSON(data: data) else { return }
                completion(popularMovies)
            }
        }
    }

    func parseJSON(data: Data) -> PopularMoviesResponseModel? {
        let decoder = JSONDecoder()

        do {
            let decodedData = try decoder.decode(PopularMoviesResponseModel.self, from: data)
            return decodedData
        } catch {
            return nil
        }
    }
}
