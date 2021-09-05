//
//  APIConstants.swift
//  movieApp
//
//  Created by Can Kurtur on 3.09.2021.
//

import Foundation

struct APIConstants {
    static let baseURL = "https://api.themoviedb.org/3/movie/popular?"
    static let apiKey = "d6c77054336371f41e11b6450daae907"
    static let popularMovieURL = "\(APIConstants.baseURL)api_key=\(APIConstants.apiKey)&language=en-US&page=1"
    static let movieDetailsURL = "https://api.themoviedb.org/3/movie/436969?api_key=\(APIConstants.apiKey)&language=en-US"
}
