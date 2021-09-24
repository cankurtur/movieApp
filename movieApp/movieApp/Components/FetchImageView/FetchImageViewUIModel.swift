//
//  FetchImageViewUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 15.09.2021.
//

import Foundation

struct FetchImageViewUIModel {
    // MARK: - Properties
    let imageLink: String

    // MARK: - Business Logic
    init(imageLink: String) {
        self.imageLink = imageLink
    }
}
