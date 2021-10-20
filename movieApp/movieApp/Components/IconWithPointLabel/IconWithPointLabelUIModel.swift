//
//  IconWithPointLabelUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

struct IconWithPointLabelUIModel {
    // MARK: - Properties
    let icon: UIImage
    let pointNumberText: String
    let fontSize: CGFloat

    // MARK: - Business Logic
    init(icon: UIImage = UIImage(), pointNumberText: String = "", fontSize: CGFloat = 10) {
        self.icon = icon
        self.pointNumberText = pointNumberText
        self.fontSize = fontSize
    }

    init(pointNumberText: String) {
        self.icon = .starIcon
        self.pointNumberText = pointNumberText
        self.fontSize = 12
    }
}
