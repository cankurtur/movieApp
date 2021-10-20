//
//  TvSeriesDetailsViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 22.09.2021.
//

import Foundation

struct TvSeriesDetailsViewModel {
    // MARK: - Properties
    let networking = Networking()
    var genresUserDefault = GenresUserDefaults()

    // MARK: - Business Logic
    func getTvSeriesDetails(id: Int, completion: @escaping(TvSeriesDetailsUIModel) -> Void ) {
        let tvSeriesDetailsEndPoint = "\(APIConstants.tvSeriesDetailsBaseURL)\(id)\(APIConstants.tvSeriesDetailsLastURL)"
        let tvSeriesCastEndPoint = "\(APIConstants.tvSeriesCastBaseURL)\(id)\(APIConstants.tvSeriesCastLastURL)"

        networking.performRequest(url: tvSeriesDetailsEndPoint) { (result: Result<TvSeriesDetailsResponseModel, Error>) in
            switch result {
            case.success(let tvSeriesDetailsResponseModel):
                networking.performRequest(url: tvSeriesCastEndPoint) { (result: Result<TvSeriesCastResponseModel, Error>) in
                    switch result {
                    case .success(let tvSeriesCastResponseModel):
                        let tvSeriesDetailsUIModel = TvSeriesDetailsUIModel.init(
                            tvSeriesDetailsResponseModel: tvSeriesDetailsResponseModel,
                            tvSeriesCastResponseModel: tvSeriesCastResponseModel
                        )
                        completion(tvSeriesDetailsUIModel)
                    case .failure(let error):
                        print(error)
                    }
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
