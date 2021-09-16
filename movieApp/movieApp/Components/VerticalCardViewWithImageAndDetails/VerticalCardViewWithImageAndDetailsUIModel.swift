//
//  VerticalCardViewWithImageAndDetailsUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 16.09.2021.
//

import UIKit

struct VerticalCardViewWithImageAndDetailsUIModel {
    // MARK: - Properties
    let image: UIImage
    let title: String
    let iconWithPointLabelUIModel: IconWithPointLabelUIModel
    // poster path will be added

    // MARK: - Business Logic
    init(image: UIImage,
         title: String,
         iconWithPointLabelUIModel: IconWithPointLabelUIModel) {
        self.image = image
        self.title = title
        self.iconWithPointLabelUIModel = iconWithPointLabelUIModel
    }
}
