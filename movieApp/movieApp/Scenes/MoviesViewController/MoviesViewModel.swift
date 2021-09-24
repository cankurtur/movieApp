//
//  MoviesViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

struct MoviesViewModel {
    // MARK: - Properties
    let networking = Networking()
    var genresUserDefault = GenresUserDefaults()

    init() {
        getMovieGenres()
    }

    func getNowPlayingMovies(completion: @escaping([SliderContents]) -> Void) {
        var imageCollectionWithPDArray: [SliderContents] = []
        networking.performRequest(url: APIConstants.nowPlayingMoviesURL) { (result: Result<NowPlayingMoviesResponseModel, Error>) in
            switch result {
            case .success(let nowPlayingMoviesResponseModel):
                for nowPlayingMovies in nowPlayingMoviesResponseModel.results {
                    let titleText = nowPlayingMovies.title
                    let voteAverage = String(format: "%.1f", nowPlayingMovies.voteAverage)
                    let genreIds = nowPlayingMovies.genreIds
                    let posterPath = nowPlayingMovies.posterPath
                    let detailsText = self.movieGenresIdToString(intArray: genreIds)

                    let imageCollectionWithPDModel = SliderContents(
                        image: .dummyImage,
                        pointAndDetails: PointAndDetailsContainerViewUIModel(
                            iconWithPointLabelView: IconWithPointLabelUIModel(
                                pointNumberText: voteAverage
                            ),
                            titleText: titleText,
                            detailsText: detailsText
                        ),
                        posterPath: posterPath
                    )
                    imageCollectionWithPDArray.append(imageCollectionWithPDModel)
                }
                completion(imageCollectionWithPDArray)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getPopularMovies(completion: @escaping([CardViewWithImageAndDetailsUIModel]) -> Void) {
        var cardViewArray: [CardViewWithImageAndDetailsUIModel] = []
        networking.performRequest(url: APIConstants.popularMoviesURL) {(result: Result<PopularMoviesResponseModel, Error>) in
            switch result {
            case .success(let popularMoviesResponseModel):
                for popularMovies in popularMoviesResponseModel.results {
                    let id = popularMovies.id
                    let titleText = popularMovies.title
                    let voteAverage = String(format: "%.1f", popularMovies.voteAverage)
                    let releaseDate = popularMovies.releaseDate
                    let genreIds = popularMovies.genreIds
                    let detailsText = self.movieGenresIdToString(intArray: genreIds)
                    let posterPath = popularMovies.posterPath

                    let cardViewModel = CardViewWithImageAndDetailsUIModel(
                        id: id,
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
                        ),
                        posterPath: FetchImageViewUIModel(imageLink: posterPath)
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
        if genresUserDefault.checkUserDefault(key: UserDefaultsConstants.movieGenresDict) {
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
                genresUserDefault.setUserDefault(value: movieGenresDict, key: UserDefaultsConstants.movieGenresDict)
            case .failure(let error):
                print(error)
            }
        }
    }

    func movieGenresIdToString(intArray: [Int]) -> String {
        var detailsString = ""
        var editedString = ""
        if genresUserDefault.checkUserDefault(key: UserDefaultsConstants.movieGenresDict) {
            let dict = genresUserDefault.getUserDefault(key: UserDefaultsConstants.movieGenresDict)
            intArray.forEach { element in
                let key = element.description
                if dict.keys.contains(key), let value = dict[key], !value.isEmpty {
                    detailsString += "\(value), "
                }
            }
            editedString = String(detailsString.dropLast(2))
        }
        return editedString
    }
}
