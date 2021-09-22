//
//  VerticalCardViewWithImageAndDetailsUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 19.09.2021.
//

import UIKit

struct VerticalCardViewWithImageAndDetailsUIModel {
    // MARK: - Properties

    let title: String
    let iconWithPointLabelUIModel: IconWithPointLabelUIModel
    let posterPath: FetchImageViewUIModel
    // MARK: - Business Logic
    init(title: String,
         iconWithPointLabelUIModel: IconWithPointLabelUIModel,
         posterPath: FetchImageViewUIModel) {
        self.title = title
        self.iconWithPointLabelUIModel = iconWithPointLabelUIModel
        self.posterPath = posterPath
    }
}
