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
    
    func getPopularMovies(completion: @escaping(CardViewWithImageAndDetailsUIModel) -> Void) {
        networking.performRequest { popularMovies in
            let title = popularMovies.results.first?.title ?? ""
            let cardViewWithImageAndDetailsModel = CardViewWithImageAndDetailsUIModel(
                coverImageText: "Joker",
                titleText: title,
                detailsText: "Crime, Drama, Thriller ",
                imageWithLabelView: ImageWithLabelUIModel(
                    image: .calendarIcon,
                    labelText: "04.11.2019"
                ),
                iconWithPointLabel: IconWithPointLabelUIModel(
                    icon: .starIcon,
                    pointNumberText: "9.8"
                )
            )
            completion(cardViewWithImageAndDetailsModel)
        }
    }
}
