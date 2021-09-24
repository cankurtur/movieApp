//
//  ImageCollectionViewWithPointAndDetailsContainerViewUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 11.09.2021.
//

import UIKit

struct ImageCollectionViewWithPointAndDetailsContainerViewUIModel {
    // MARK: - Properties
    let contents: [SliderContents]

    // MARK: - Business Logic
    init(contents: [SliderContents]) {
        self.contents = contents
    }

    func fetchImages() -> [UIImage] {
        let imagesArray = contents.map { contents -> UIImage in
            let mappedImage = contents.image
            return mappedImage
        }
        return imagesArray
    }
}

struct SliderContents {
    // MARK: - Properties
    let image: UIImage
    let pointAndDetails: PointAndDetailsContainerViewUIModel
    let posterPath: String

    // MARK: - Business Logic
    init(image: UIImage,
         pointAndDetails: PointAndDetailsContainerViewUIModel,
         posterPath: String) {
        self.image = image
        self.pointAndDetails = pointAndDetails
        self.posterPath = posterPath
    }
}
