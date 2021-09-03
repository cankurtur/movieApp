//
//  MainViewModel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

struct MainViewModel {
    // MARK: - Properties
    var cardViewWithImageAndDetailsData: CardViewWithImageAndDetailsUIModel {
        let cardViewWithImageAndDetailsModel = CardViewWithImageAndDetailsUIModel(
            coverImage: .dummyImage,
            titleText: "Joker",
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
        return cardViewWithImageAndDetailsModel
    }
}
