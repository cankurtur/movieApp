//
//  LabelWithCircleImageViewUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 24.09.2021.
//

import Foundation

struct LabelWithCircleImageViewUIModel {
    let titleText: String
    let contents: [CircleImageAndTextContents]
}

struct CircleImageAndTextContents {
    let posterPath: String
    let text: String
}
