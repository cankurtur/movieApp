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
        let moviesCastEndPoint = "\(APIConstants.moviesCastBaseURL)\(id)\(APIConstants.moviesCastLastURL)"
        networking.performRequest(url: moviesDetailsEndPoint) { (result: Result<MoviesDetailsResponseModel, Error>) in
            switch result {
            case.success(let moviesDetailsResponseModel):
                networking.performRequest(url: moviesCastEndPoint) { (result: Result<MoviesCastResponseModel, Error>) in
                    switch result {
                    case .success(let moviesCastResponseModel):
                        let moviesDetailsUIModel = MoviesDetailsUIModel.init(
                            moviesDetailsResponseModel: moviesDetailsResponseModel,
                            moviesCastResponseModel: moviesCastResponseModel
                        )
                        completion(moviesDetailsUIModel)
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
