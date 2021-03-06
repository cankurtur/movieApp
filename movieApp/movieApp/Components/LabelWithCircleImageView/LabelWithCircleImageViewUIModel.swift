//
//  LabelWithCircleImageViewUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 24.09.2021.
//

import Foundation

struct LabelWithCircleImageViewUIModel {
    // MARK: - Properties
    let titleText: String
    let contents: [CircleImageAndTextContents]
}

struct CircleImageAndTextContents {
    // MARK: - Properties
    let id: Int
    let posterPath: String
    let text: String
}
