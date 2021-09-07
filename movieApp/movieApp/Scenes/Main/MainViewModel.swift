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
    var genreUserDefault = GenreUserDefault()


    init() {
        getMovieGenres()
    }

    func getPopularMovies(completion: @escaping([CardViewWithImageAndDetailsUIModel]) -> Void) {
        var cardViewArray: [CardViewWithImageAndDetailsUIModel] = []
        networking.performRequest(url: APIConstants.popularMovieURL) {(result: Result<PopularMoviesResponseModel, Error>) in
            switch result {
            case .success(let popularMoviesResponseModel):
                for popularMovies in popularMoviesResponseModel.results {
                    let titleText = popularMovies.title
                    let voteAverage = String(format: "%.1f", popularMovies.voteAverage)
                    let releaseDate = popularMovies.releaseDate
                    let genreIds = popularMovies.genreIds
                    let detailsText = self.genresIdToString(intArray: genreIds)
                    let cardViewModel = CardViewWithImageAndDetailsUIModel(
                        coverImageText: "Joker",
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
        if genreUserDefault.checkUserDefault(key: UserDefaultsConstant.genresDict) {
            return
        }
        networking.performRequest(url: APIConstants.movieGenresURL) { (result: Result<MovieGenresResponseModel, Error>) in
            var movieGenresDict: [String: String] = [:]
            switch result {
            case .success(let genresResponseModel):
                for movieGenres in genresResponseModel.genres {
                    let id = movieGenres.id.description
                    let name = movieGenres.name
                    movieGenresDict[id] = name
                }
                genreUserDefault.setUserDefault(value: movieGenresDict, key: UserDefaultsConstant.genresDict)
            case .failure(let error):
                print(error)
            }
        }
    }

    func genresIdToString(intArray: [Int]) -> String {
        var detailsString = ""
        var editedString = ""
        if genreUserDefault.checkUserDefault(key: UserDefaultsConstant.genresDict) {
            let dict = genreUserDefault.getUserDefault(key: UserDefaultsConstant.genresDict)
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

struct UserDefaultsConstant {
    static let genresDict = "genresDict"
}

class GenreUserDefault {
    var userDefaults = UserDefaults.standard

    func setUserDefault(value: [String: String], key: String) {
        userDefaults.setValue(value, forKey: key)
    }

    func getUserDefault(key: String) -> [String: String] {
        if let object = userDefaults.object(forKey: key) {
            return object as? [String: String] ?? ["": ""]
        } else {
            return ["": ""]
        }
    }

    func checkUserDefault(key: String) -> Bool {
        if userDefaults.dictionary(forKey: key) != nil {
            return true
        } else {
            return false
        }
    }

    func deleteUserDefault(key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
