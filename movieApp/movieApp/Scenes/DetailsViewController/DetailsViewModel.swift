//
//  DetailsViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 22.09.2021.
//

import Foundation

struct DetailsViewModel {
    let networking = Networking()
    var genresUserDefault = GenresUserDefaults()

    func getDetails(id: Int, completion: @escaping(DetailsUIModel) -> Void ) {
        let endPointString = "\(APIConstants.tvSeriesDetailsBaseURL)\(id)\(APIConstants.tvSeriesDetailsLastURL)"
        networking.performRequest(url: endPointString) { (result: Result<TvSeriesDetailsResponseModel, Error>) in
            switch result {
            case.success(let tvSeriesDetailsResponseModel):
                let detailsUIModel = DetailsUIModel.init(tvSeriesDetailsResponseModel: tvSeriesDetailsResponseModel)
                completion(detailsUIModel)
            case.failure(let error):
                print(error)
            }
        }
    }
}
