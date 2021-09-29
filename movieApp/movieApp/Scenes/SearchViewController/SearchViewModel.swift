//
//  SearchViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 27.09.2021.
//

import Foundation

struct SearchViewModel {
    let networking = Networking()

    func getMultiSearch(query: String, completion: @escaping([SearchCardViewModel]) -> Void) {
        var searchCardViewArray: [SearchCardViewModel]?

        let url = "\(APIConstants.multiSearchURL)\(query)"
        networking.performRequest(url: url) { (result: Result<MultiSearchResponseModel, Error>) in
            switch result {
            case.success(let multiSearchResponseModel):

                for multiSearch in multiSearchResponseModel.results {
                    switch multiSearch.mediaType {
                    case "movie":
                        let id = multiSearch.id
                        let moviesCastEndPoint = "\(APIConstants.moviesCastBaseURL)\(id)\(APIConstants.moviesCastLastURL)"
                        networking.performRequest(url: moviesCastEndPoint) { (result: Result<MoviesCastResponseModel, Error>) in
                            switch result {
                            case .success(let moviesCastResponseModel):
                                let editedDetails = moviesCastResponseModel.cast.reduce("") { result, cast -> String in
                                    var detailsString = result
                                    detailsString += "\(cast.name), "
                                    return detailsString
                                }
                                let details = String(editedDetails.dropLast(2))

                                let searchCardViewModelForMovie = SearchCardViewModel(
                                    posterPath: multiSearch.posterPath,
                                    titleText: multiSearch.name,
                                    detailsText: details,
                                    imageWithLabelViewModel: ImageWithLabelUIModel(
                                        image: .calendarIcon,
                                        labelText: "Movie"
                                    )
                                )
                                searchCardViewArray?.append(searchCardViewModelForMovie)
                            case .failure(let error):
                                print(error)
                            }
                        }

                    case "tv":

                        let id = multiSearch.id
                        let tvSeriesCastEndPoint = "\(APIConstants.tvSeriesCastBaseURL)\(id)\(APIConstants.tvSeriesCastLastURL)"
                        networking.performRequest(url: tvSeriesCastEndPoint) { (result: Result<TvSeriesCastResponseModel, Error>) in
                            switch result {
                            case .success(let tvSeriesCastResponseModel):
                                let editedDetails = tvSeriesCastResponseModel.cast.reduce("") { result, cast -> String in
                                    var detailsString = result
                                    detailsString += "\(cast.name), "
                                    return detailsString
                                }
                                let details = String(editedDetails.dropLast(2))

                                let searchCardViewModelForTv = SearchCardViewModel(
                                    posterPath: multiSearch.posterPath,
                                    titleText: multiSearch.name,
                                    detailsText: details,
                                    imageWithLabelViewModel: ImageWithLabelUIModel(
                                        image: .calendarIcon,
                                        labelText: "Movie"
                                    )
                                )
                                searchCardViewArray?.append(searchCardViewModelForTv)
                            case .failure(let error):
                                print(error)
                            }
                        }


                    case "person":

                        let id = multiSearch.id
                        let peopleDetailsURL = "\(APIConstants.peopleDetailsBaseURL)\(id)\(APIConstants.peopleDetailsLastURL)"

                        networking.performRequest(url: peopleDetailsURL) { (result: Result<PeopleDetailsResponseModel, Error>) in
                            switch result {
                            case.success(let peopleDetailsResponseModel):
                                var bornText = ""
                                if let birthday = peopleDetailsResponseModel.birthday, let bornPlace = peopleDetailsResponseModel.placeOfBirth {
                                    bornText = "Born: \(birthday) in \(bornPlace)"
                                } else {
                                    bornText = "Born: Unknown"
                                }

                                let searchCardViewForPerson = SearchCardViewModel(
                                    posterPath: multiSearch.profilePath,
                                    titleText: multiSearch.name,
                                    detailsText: bornText,
                                    imageWithLabelViewModel: ImageWithLabelUIModel(
                                        image: .calendarIcon,
                                        labelText: "Actor"
                                    )
                                )
                                searchCardViewArray?.append(searchCardViewForPerson)
                            case .failure(let error):
                                print(error)
                            }
                        }
                    default:
                        print("error")
                    }
                }
                completion(searchCardViewArray ?? [])
            case .failure(let error):
                print(error)
            }
        }
    }
}
