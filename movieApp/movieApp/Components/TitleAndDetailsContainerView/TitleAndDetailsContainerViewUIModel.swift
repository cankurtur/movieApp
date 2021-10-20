//
//  TitleAndDetailsContainerViewUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 22.09.2021.
//

import Foundation

struct TitleAndDetailsContainerViewUIModel {
    // MARK: - Properties
    let titleText: String
    let detailsText: String
    let durationViewUIModel: ImageWithLabelUIModel
    let typeViewUIModel: ImageWithLabelUIModel
    let separatorIsHidden: Bool

    // MARK: - Business Logic
    init(titleText: String, detailsText: String, durationViewUIModel: ImageWithLabelUIModel, typeViewUIModel: ImageWithLabelUIModel, separatorIsHidden: Bool = false) {
        self.titleText = titleText
        self.detailsText = detailsText
        self.durationViewUIModel = durationViewUIModel
        self.typeViewUIModel = typeViewUIModel
        self.separatorIsHidden = separatorIsHidden
    }
}
