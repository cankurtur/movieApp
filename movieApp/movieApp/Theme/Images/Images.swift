//
//  Images.swift
//  movieApp
//
//  Created by Can Kurtur on 18.08.2021.
//

import UIKit

class Images {
    // MARK: - Properties
    static let calendar: UIImage = getImage(imageName: "calendar")
    static let star: UIImage = getImage(imageName: "shape")
    static let dummyImage: UIImage = getImage(imageName: "dummyImage")
    static let clock: UIImage = getImage(imageName: "clock")
    static let iconMiniX: UIImage = getImage(imageName: "iconMiniX")
    static let iconMiniSearch: UIImage = getImage(imageName: "iconMiniSearch")
    static let emptyViewImage: UIImage = getImage(imageName: "emptyViewImage")

    // To add new UIImage we have to use this function below
    static func getImage(imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName) else {
            return UIImage()
        }
        return image
    }
}
