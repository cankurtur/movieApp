//
//  TvSeriesDetailsUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 23.09.2021.
//

import Foundation

struct TvSeriesDetailsUIModel {
    let posterPath: String
    let voteAverage: String
    let name: String
    let details: String
    let episodeRunTime: String
    let seriesRunTime: String
    let overview: String
    let numberOfSeasons: String

    init(tvSeriesDetailsResponseModel: TvSeriesDetailsResponseModel) {
        // Tv Series Types
        let editedDetails = tvSeriesDetailsResponseModel.genres.reduce("") { result, genres -> String in
            var detailsString = result
            detailsString += "\(genres.name), "
            return detailsString
        }
        let details = String(editedDetails.dropLast(2))
        self.details = details

        // Tv Series Episode Time
        if tvSeriesDetailsResponseModel.episodeRunTime.isEmpty {
            self.episodeRunTime = "-"
        } else {
            var totalTime = 0
            for episodeTime in tvSeriesDetailsResponseModel.episodeRunTime {
                totalTime += episodeTime
            }
            let averageOfEpisodeTime = totalTime / (tvSeriesDetailsResponseModel.episodeRunTime.count)
            self.episodeRunTime = "\(averageOfEpisodeTime) min"
        }
        
        // Tv Series Season Time
        var seriesRunTime = ""

        if let nextEpisodeAirDate = tvSeriesDetailsResponseModel.nextEpisodeToAir?.airDate {
            let startYear = tvSeriesDetailsResponseModel.firstAirDate.prefix(4)
            let endYear = nextEpisodeAirDate.prefix(4)
            seriesRunTime = "TV Series (\(startYear)-\(endYear))"
        } else {
            let startYear = tvSeriesDetailsResponseModel.firstAirDate.prefix(4)
            let endYear = tvSeriesDetailsResponseModel.lastAirDate.prefix(4)
            seriesRunTime = "TV Series (\(startYear)-\(endYear))"
        }
        self.seriesRunTime = seriesRunTime
        self.name = tvSeriesDetailsResponseModel.name
        self.posterPath = tvSeriesDetailsResponseModel.posterPath
        self.voteAverage = String(format: "%.1f", tvSeriesDetailsResponseModel.voteAverage)
        self.overview = tvSeriesDetailsResponseModel.overview
        self.numberOfSeasons = "\(tvSeriesDetailsResponseModel.numberOfSeasons) seasons"
    }
}
