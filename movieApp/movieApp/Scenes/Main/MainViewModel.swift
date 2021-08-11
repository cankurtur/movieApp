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
            coverImageText: "Joker",
            titleText: "Joker",
            detailsText: "Crime, Drama, Thriller ",
            imageWithLabelView: ImageWithLabelUIModel(
                imageName: "calender",
                labelText: "04.11.2019"
            ),
            iconWithPointLabel: IconWithPointLabelUIModel(
                iconName: "star.fill",
                pointNumberText: "9.8"
            )
        )
        return cardViewWithImageAndDetailsModel
    }
}
