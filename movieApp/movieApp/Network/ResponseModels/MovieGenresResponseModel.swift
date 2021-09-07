//
//  MovieDetailsResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 5.09.2021.
//

import Foundation

struct MovieGenresResponseModel: Codable {
    let genres: [GenresResponseModel]
}

struct GenresResponseModel: Codable {
    let id: Int
    let name: String
}
