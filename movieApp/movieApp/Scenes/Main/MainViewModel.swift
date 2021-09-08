//
//  MainViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

struct MainViewModel {
    // MARK: - Properties
    let networking = Networking()
    var movieGenresUserDefault = MovieGenresUserDefaults()


    init() {
        getMovieGenres()
    }

    func getPopularMovies(completion: @escaping([CardViewWithImageAndDetailsUIModel]) -> Void) {
        var cardViewArray: [CardViewWithImageAndDetailsUIModel] = []
        networking.performRequest(url: APIConstants.popularMoviesURL) {(result: Result<PopularMoviesResponseModel, Error>) in
            switch result {
            case .success(let popularMoviesResponseModel):
                for popularMovies in popularMoviesResponseModel.results {
                    let titleText = popularMovies.title
                    let voteAverage = String(format: "%.1f", popularMovies.voteAverage)
                    let releaseDate = popularMovies.releaseDate
                    let genreIds = popularMovies.genreIds
                    let detailsText = self.genresIdToString(intArray: genreIds)

                    let cardViewModel = CardViewWithImageAndDetailsUIModel(
                        coverImage: .dummyImage,
                        titleText: titleText,
                        detailsText: detailsText,
                        imageWithLabelView: ImageWithLabelUIModel(
                            image: .calendarIcon,
                            labelText: releaseDate
                        ),
                        iconWithPointLabel: IconWithPointLabelUIModel(
                            icon: .starIcon,
                            pointNumberText: voteAverage
                        )
                    )
                    cardViewArray.append(cardViewModel)
                }
                completion(cardViewArray)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getMovieGenres() {
        if movieGenresUserDefault.checkUserDefault(key: UserDefaultsConstants.genresDict) {
            return
        }
        networking.performRequest(url: APIConstants.movieGenresURL) { (result: Result<MovieGenreResponseModel, Error>) in
            var movieGenresDict: [String: String] = [:]
            switch result {
            case .success(let genresResponseModel):
                for movieGenres in genresResponseModel.genres {
                    let id = movieGenres.id.description
                    let name = movieGenres.name
                    movieGenresDict[id] = name
                }
                movieGenresUserDefault.setUserDefault(value: movieGenresDict, key: UserDefaultsConstants.genresDict)
            case .failure(let error):
                print(error)
            }
        }
    }

    func genresIdToString(intArray: [Int]) -> String {
        var detailsString = ""
        var editedString = ""
        if movieGenresUserDefault.checkUserDefault(key: UserDefaultsConstants.genresDict) {
            let dict = movieGenresUserDefault.getUserDefault(key: UserDefaultsConstants.genresDict)
            for index in 0..<(intArray.count) {
                let key = intArray[index].description
                if dict.keys.contains(key), let value = dict[key], !value.isEmpty {
                    detailsString += "\(value), "
                }
            }
            editedString = String(detailsString.dropLast(2))
        }
        return editedString
    }
}
