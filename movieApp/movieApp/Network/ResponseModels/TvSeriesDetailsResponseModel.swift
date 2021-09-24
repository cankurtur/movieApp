//
//  TvSeriesDetailsResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 23.09.2021.
//

import Foundation

struct TvSeriesDetailsResponseModel: Codable {
    let posterPath: String
    let voteAverage: Double
    let name: String
    let genres: [GenresForTvSeriesDetailsResponseModel]
    let episodeRunTime: [Int]
    let firstAirDate: String
    let lastAirDate: String
    let nextEpisodeToAir: NextEpisodeToAirResponseModel?
    let overview: String
    let numberOfSeasons: Int

    private enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case name = "name"
        case genres = "genres"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case lastAirDate = "last_air_date"
        case nextEpisodeToAir = "next_episode_to_air"
        case overview = "overview"
        case numberOfSeasons = "number_of_seasons"
    }
}

struct GenresForTvSeriesDetailsResponseModel: Codable {
    let id: Int
    let name: String
}

struct NextEpisodeToAirResponseModel: Codable {
    let airDate: String?

    private enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
    }
}
