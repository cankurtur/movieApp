//
//  CardViewWithImageAndDetailsUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

struct CardViewWithImageAndDetailsUIModel {
    // MARK: - Properties
    let id: Int
    let coverImage: UIImage
    let titleText: String
    let detailsText: String
    let imageWithLabelView: ImageWithLabelUIModel
    let iconWithPointLabel: IconWithPointLabelUIModel
    let posterPath: FetchImageViewUIModel

    // MARK: - Business Logic
    init(id: Int,
         coverImage: UIImage,
         titleText: String,
         detailsText: String,
         imageWithLabelView: ImageWithLabelUIModel,
         iconWithPointLabel: IconWithPointLabelUIModel,
         posterPath: FetchImageViewUIModel) {
        self.id = id
        self.coverImage = coverImage
        self.titleText = titleText
        self.detailsText = detailsText
        self.imageWithLabelView = imageWithLabelView
        self.iconWithPointLabel = iconWithPointLabel
        self.posterPath = posterPath
    }
}
