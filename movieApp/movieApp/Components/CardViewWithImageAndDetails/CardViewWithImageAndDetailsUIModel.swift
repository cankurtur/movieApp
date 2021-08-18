//
//  CardViewWithImageAndDetailsUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import Foundation

struct CardViewWithImageAndDetailsUIModel {
    // MARK: - Properties
    let coverImageText: String
    let titleText: String
    let detailsText: String
    let imageWithLabelView: ImageWithLabelUIModel
    let iconWithPointLabel: IconWithPointLabelUIModel

    // MARK: - Business Logic
    init(coverImageText: String,
         titleText: String,
         detailsText: String,
         imageWithLabelView: ImageWithLabelUIModel,
         iconWithPointLabel: IconWithPointLabelUIModel) {
        self.coverImageText = coverImageText
        self.titleText = titleText
        self.detailsText = detailsText
        self.imageWithLabelView = imageWithLabelView
        self.iconWithPointLabel = iconWithPointLabel
    }
}
