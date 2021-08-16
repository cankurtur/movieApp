//
//  ImageWithLabel.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import Foundation

struct ImageWithLabelUIModel {
    // MARK: - Properties
    var imageName: String
    var labelText: String

    // MARK: - Business Logic
    init(imageName: String = "", labelText: String = "") {
        self.imageName = imageName
        self.labelText = labelText
    }
}
