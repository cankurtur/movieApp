//
//  MoviesDetailsUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 25.09.2021.
//

import Foundation

struct MoviesDetailsUIModel {
    let posterPath: String
    let voteAverage: String
    let title: String
    let details: String
    let runtime: String
    let releaseDate: String
    let overview: String

    init(moviesDetailsResponseModel: MoviesDetailsResponseModel) {
        self.posterPath = moviesDetailsResponseModel.posterPath
        self.voteAverage = String(format: "%.1f", moviesDetailsResponseModel.voteAverage)
        self.title = moviesDetailsResponseModel.title

        // Tv Series Types
        let editedDetails = moviesDetailsResponseModel.genres.reduce("") { result, genres -> String in
            var detailsString = result
            detailsString += "\(genres.name), "
            return detailsString
        }
        let details = String(editedDetails.dropLast(2))
        self.details = details

        self.runtime = "\(moviesDetailsResponseModel.runtime) min"
        self.releaseDate = moviesDetailsResponseModel.releaseDate
        self.overview = moviesDetailsResponseModel.overview
    }
}
