//
//  MovieDetailsResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 5.09.2021.
//

import Foundation

struct MovieGenreResponseModel: Codable {
    let genres: [GenresForMovieResponseModel]
}

struct GenresForMovieResponseModel: Codable {
    let id: Int
    let name: String
}
