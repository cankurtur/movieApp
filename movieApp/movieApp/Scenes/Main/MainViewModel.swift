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

    func getPopularMovies(completion: @escaping([CardViewWithImageAndDetailsUIModel]) -> Void) {
        var cardView: [CardViewWithImageAndDetailsUIModel] = []
        networking.performRequest(url: APIConstants.popularMovieURL) {(result: Result<PopularMoviesResponseModel, Error>) in
            switch result {
            case .success(let popularMoviesResponseModel):
                for popularMovies in popularMoviesResponseModel.results {
                    let titleText = popularMovies.title
                    let voteAverage = String(format: "%.1f", popularMovies.voteAverage)
                    let releaseDate = popularMovies.releaseDate
                    let cardViewModel = CardViewWithImageAndDetailsUIModel(
                        coverImageText: "joker",
                        titleText: titleText,
                        detailsText: "sdasd",
                        imageWithLabelView: ImageWithLabelUIModel(
                            image: .calendarIcon,
                            labelText: releaseDate
                        ),
                        iconWithPointLabel: IconWithPointLabelUIModel(
                                icon: .starIcon,
                                pointNumberText: voteAverage
                            )
                    )
                    cardView.append(cardViewModel)
                }
                completion(cardView)
            case .failure(let error):
                print(error)
            }
        }
    }
}
