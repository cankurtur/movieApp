//
//  MovieDetailsResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 5.09.2021.
//

import Foundation

struct MovieDetailsResponseModel: Decodable {
    let genres: [MovieTypeResponseModel]
}

struct MovieTypeResponseModel: Decodable {
    let id: Int
    let name: String
}
