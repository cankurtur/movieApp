//
//  MoviesDetailsUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 25.09.2021.
//

import Foundation

struct MoviesDetailsUIModel {
    // Init DateFormatManager
    var dateFormatManager = DateFormatManager()
    // MARK: - Properties
    let posterPath: String
    let voteAverage: String
    let title: String
    let details: String
    let runtime: String
    let releaseDate: String
    let overview: String
    let castHeadline: String
    let cast: [CircleImageAndTextContents]

    // MARK: - Business Logic
    init(moviesDetailsResponseModel: MoviesDetailsResponseModel, moviesCastResponseModel: MoviesCastResponseModel) {
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

        // Release Date Format
        let releaseDateFromService = moviesDetailsResponseModel.releaseDate
        let formattedDate = dateFormatManager.formatStringToDate(string: releaseDateFromService)
        let resultOfReleaseDate = dateFormatManager.formatDateToString(date: formattedDate)
        self.releaseDate = resultOfReleaseDate

        self.overview = moviesDetailsResponseModel.overview

        // Cast
        self.castHeadline = "Cast"

        var castArray: [CircleImageAndTextContents] = []
        for moviesCast in moviesCastResponseModel.cast {
            let circleImageAndTextContent = CircleImageAndTextContents(
                id: moviesCast.id,
                posterPath: moviesCast.profilePath ?? "",
                text: moviesCast.name ?? "-"
            )
            castArray.append(circleImageAndTextContent)
        }
        self.cast = castArray
    }
}
