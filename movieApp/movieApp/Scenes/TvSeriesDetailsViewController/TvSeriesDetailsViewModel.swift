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
        networking.performRequest(url: tvSeriesDetailsEndPoint) { (result: Result<TvSeriesDetailsResponseModel, Error>) in
            switch result {
            case.success(let tvSeriesDetailsResponseModel):
                let tvSeriesDetailsUIModel = TvSeriesDetailsUIModel.init(tvSeriesDetailsResponseModel: tvSeriesDetailsResponseModel)
                completion(tvSeriesDetailsUIModel)
            case.failure(let error):
                print(error)
            }
        }
    }
}
