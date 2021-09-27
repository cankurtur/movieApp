//
//  PointAndDetailsContainerViewUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 10.09.2021.
//

import Foundation

struct PointAndDetailsContainerViewUIModel {
    let iconWithPointLabelView: IconWithPointLabelUIModel
    let titleText: String
    let detailsText: String
    let separator: Bool

    init(iconWithPointLabelView: IconWithPointLabelUIModel, titleText: String, detailsText: String, separator: Bool = true) {
        self.iconWithPointLabelView = iconWithPointLabelView
        self.titleText = titleText
        self.detailsText = detailsText
        self.separator = separator
    }
}
