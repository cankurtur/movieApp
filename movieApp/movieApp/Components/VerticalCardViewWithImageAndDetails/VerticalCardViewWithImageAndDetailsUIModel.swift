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
    let posterPath: FetchImageView
    
    // MARK: - Business Logic
    init(image: UIImage,
         title: String,
         iconWithPointLabelUIModel: IconWithPointLabelUIModel,
         posterPath: FetchImageView) {
        self.image = image
        self.title = title
        self.iconWithPointLabelUIModel = iconWithPointLabelUIModel
        self.posterPath = posterPath
    }
}
