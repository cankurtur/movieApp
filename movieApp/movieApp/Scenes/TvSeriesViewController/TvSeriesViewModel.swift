//
//  TvSeriesViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 17.09.2021.
//

import Foundation

struct TvSeriesViewModel {
    let networking = Networking()
    var genresUserDefault = GenresUserDefaults()

    init() {
        getTvSeriesGenres()
    }

    func getPopularTvSeries(completion: @escaping([SliderContents]) -> Void) {
        var imageCollectionWithPDArray: [SliderContents] = []
        networking.performRequest(url: APIConstants.popularTvSeriesURL) { (result: Result<PopularTvSeriesResponseModel, Error>) in
            switch result {
            case .success(let popularTvSeriesResponseModel):
                for popularTvSeries in popularTvSeriesResponseModel.results {
                    let titleText = popularTvSeries.name
                    let voteAverage = String(format: "%.1f", popularTvSeries.voteAverage)
                    let genreIds = popularTvSeries.genreIds
                    let posterPath = popularTvSeries.posterPath
                    let detailsText = genresIdToString(intArray: genreIds)

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

    func getTopRatedTvSeries(completion: @escaping([VerticalCardViewWithImageAndDetailsUIModel]) -> Void) {
        var verticalCardViewArray: [VerticalCardViewWithImageAndDetailsUIModel] = []
        networking.performRequest(url: APIConstants.topRatedTvSeriesURL) { (result: Result<TopRatedSeriesResponseModel, Error>) in
            switch result {
            case .success(let topRatedSeriesResponseModel):
                for topRatedSeries in topRatedSeriesResponseModel.results {
                    let id = topRatedSeries.id
                    let name = topRatedSeries.name
                    let voteAverage = String(format: "%.1f", topRatedSeries.voteAverage)
                    let posterPath = topRatedSeries.posterPath
                    
                    let verticalCardView = VerticalCardViewWithImageAndDetailsUIModel(
                        id: id,
                        title: name,
                        iconWithPointLabelUIModel: IconWithPointLabelUIModel(
                            pointNumberText: voteAverage
                        ),
                        posterPath: FetchImageViewUIModel(
                            imageLink: posterPath
                        )
                    )
                    verticalCardViewArray.append(verticalCardView)
                }
                completion(verticalCardViewArray)
            case .failure(let error):
                print(error)
            }
        }
    }

    func getTvSeriesGenres() {
        if genresUserDefault.checkUserDefault(key: UserDefaultsConstants.tvSeriesGenresDict) {
            return
        }
        networking.performRequest(url: APIConstants.tvSeriesGenresURL) { (result: Result<TvSeriesGenreResponseModel, Error>) in
            var tvSeriesGenresDict: [String: String] = [:]
            switch result {
            case .success(let genresResponseModel):
                for tvSeriesGenres in genresResponseModel.genres {
                    let id = tvSeriesGenres.id.description
                    let name = tvSeriesGenres.name
                    tvSeriesGenresDict[id] = name
                }
                genresUserDefault.setUserDefault(value: tvSeriesGenresDict, key: UserDefaultsConstants.tvSeriesGenresDict)
            case .failure(let error):
                print(error)
            }
        }
    }

    func genresIdToString(intArray: [Int]) -> String {
        var detailsString = ""
        var editedString = ""
        if genresUserDefault.checkUserDefault(key: UserDefaultsConstants.tvSeriesGenresDict) {
            let dict = genresUserDefault.getUserDefault(key: UserDefaultsConstants.tvSeriesGenresDict)
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
