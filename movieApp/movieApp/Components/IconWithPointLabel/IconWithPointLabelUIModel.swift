//
//  IconWithPointLabelUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import Foundation

struct IconWithPointLabelUIModel {
    // MARK: - Properties
    let iconName: String
    let pointNumberText: String

    // MARK: - Business Logic
    init(iconName: String = "", pointNumberText: String = "") {
        self.iconName = iconName
        self.pointNumberText = pointNumberText
    }
}
