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

    // MARK: - Business Logic
    init(icon: UIImage = UIImage(), pointNumberText: String = "") {
        self.icon = icon
        self.pointNumberText = pointNumberText
    }
}
