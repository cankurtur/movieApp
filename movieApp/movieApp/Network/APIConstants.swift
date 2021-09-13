//
//  APIConstants.swift
//  movieApp
//
//  Created by Can Kurtur on 3.09.2021.
//

import Foundation

struct APIConstants {
    static let apiKey = "d6c77054336371f41e11b6450daae907"
    
    static let popularMoviesBaseURL = "https://api.themoviedb.org/3/movie/popular?"
    static let movieGenresBaseURL = "https://api.themoviedb.org/3/genre/movie/list?"

    static let popularMoviesURL = "\(popularMoviesBaseURL)api_key=\(apiKey)&language=en-US&page=1"
    static let movieGenresURL = "\(movieGenresBaseURL)api_key=\(apiKey)&language=en-US"
}
