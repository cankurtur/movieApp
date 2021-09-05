//
//  PopularMoviesUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 5.09.2021.
//

import Foundation

struct PopularMoviesModel {
    var popularMoviesArray: [PopularMovieUIModel]
}

struct PopularMovieUIModel {
    let id: Int
    let title: String
    let releaseDate: String
    let voteAverage: String
    let genreIds: [Int]

    init(id: Int, title: String, releaseDate: String, voteAverage: String, genreIds: [Int]) {
        self.id = id
        self.title = title
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
        self.genreIds = genreIds
    }
}
