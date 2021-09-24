//
//  MoviesDetailsViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 25.09.2021.
//

import Foundation

struct MoviesDetailsViewModel {
    // MARK: - Properties
    let networking = Networking()

    // MARK: - Business Logic
    func getMoviesDetails(id: Int, completion: @escaping(MoviesDetailsUIModel) -> Void ) {
        let moviesDetailsEndPoint = "\(APIConstants.moviesDetailsBaseURL)\(id)\(APIConstants.moviesDetailsLastURL)"
        networking.performRequest(url: moviesDetailsEndPoint) { (result: Result<MoviesDetailsResponseModel, Error>) in
            switch result {
            case.success(let moviesDetailsResponseModel):
                let moviesDetailsUIModel = MoviesDetailsUIModel.init(moviesDetailsResponseModel: moviesDetailsResponseModel)
                completion(moviesDetailsUIModel)
            case.failure(let error):
                print(error)
            }
        }
    }
}
