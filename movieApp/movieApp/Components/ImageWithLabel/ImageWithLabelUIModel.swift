//
//  ImageWithLabel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

struct ImageWithLabelUIModel {
    // MARK: - Properties
    var image: UIImage
    var labelText: String

    // MARK: - Business Logic
    init(image: UIImage = UIImage(), labelText: String = "") {
        self.image = image
        self.labelText = labelText
    }
}
