//
//  UIImageExtension.swift
//  movieApp
//
//  Created by Can Kurtur on 18.08.2021.
//

import UIKit

extension UIImage {
    static let calendarIcon = Images.calendar
    static let starIcon = Images.star

    static func getImage(imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName) else {
            return UIImage()
        }
        return image
    }
}
