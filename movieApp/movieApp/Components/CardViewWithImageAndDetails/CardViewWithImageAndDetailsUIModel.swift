//
//  CardViewWithImageAndDetailsUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

struct CardViewWithImageAndDetailsUIModel {
    // MARK: - Properties
    let coverImage: UIImage
    let titleText: String
    let detailsText: String
    let imageWithLabelView: ImageWithLabelUIModel
    let iconWithPointLabel: IconWithPointLabelUIModel

    // MARK: - Business Logic
    init(coverImage: UIImage,
         titleText: String,
         detailsText: String,
         imageWithLabelView: ImageWithLabelUIModel,
         iconWithPointLabel: IconWithPointLabelUIModel) {
        self.coverImage = coverImage
        self.titleText = titleText
        self.detailsText = detailsText
        self.imageWithLabelView = imageWithLabelView
        self.iconWithPointLabel = iconWithPointLabel
    }
}
