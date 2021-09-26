//
//  APIConstants.swift
//  movieApp
//
//  Created by Can Kurtur on 3.09.2021.
//

import Foundation

struct APIConstants {
    static let apiKey = "d6c77054336371f41e11b6450daae907"

    static let imageBaseURL = "https://image.tmdb.org/t/p/w500"

    static let tvSeriesDetailsBaseURL = "https://api.themoviedb.org/3/tv/"
    static let tvSeriesDetailsLastURL = "?api_key=\(apiKey)&language=en-US"

    static let moviesDetailsBaseURL = "https://api.themoviedb.org/3/movie/"
    static let moviesDetailsLastURL = "?api_key=\(apiKey)&language=en-US"

    static let tvSeriesCastBaseURL = "https://api.themoviedb.org/3/tv/"
    static let tvSeriesCastLastURL = "/credits?api_key=\(apiKey)&language=en-US"

    static let moviesCastBaseURL = "https://api.themoviedb.org/3/movie/"
    static let moviesCastLastURL = "/credits?api_key=\(apiKey)&language=en-US"

    static let peopleDetailsBaseURL = "https://api.themoviedb.org/3/person/"
    static let peopleDetailsLastURL = "?api_key=\(apiKey)&language=en-US"

    static let popularMoviesBaseURL = "https://api.themoviedb.org/3/movie/popular?"
    static let movieGenresBaseURL = "https://api.themoviedb.org/3/genre/movie/list?"
    static let nowPlayingBaseURL = "https://api.themoviedb.org/3/movie/now_playing?"
    static let popularTvSeriesBaseURL = "https://api.themoviedb.org/3/tv/popular?"
    static let tvSeriesGenresBaseURL = "https://api.themoviedb.org/3/genre/tv/list?"
    static let topRatedTvSeriesBaseURL = "https://api.themoviedb.org/3/tv/top_rated?"

    static let popularMoviesURL = "\(popularMoviesBaseURL)api_key=\(apiKey)&language=en-US&page=1"
    static let movieGenresURL = "\(movieGenresBaseURL)api_key=\(apiKey)&language=en-US"
    static let nowPlayingMoviesURL = "\(nowPlayingBaseURL)api_key=\(apiKey)&language=en-US&page=1"
    static let popularTvSeriesURL = "\(popularTvSeriesBaseURL)api_key=\(apiKey)&language=en-US&page=1"
    static let tvSeriesGenresURL = "\(tvSeriesGenresBaseURL)api_key=\(apiKey)&language=en-US"
    static let topRatedTvSeriesURL = "\(topRatedTvSeriesBaseURL)api_key=\(apiKey)&language=en-US&page=1"
}
