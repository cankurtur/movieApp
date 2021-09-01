//
//  Colors.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

class Colors {
    // MARK: - Properties
    static let almostBlack: UIColor = getColor(colorName: "almostBlack")
    static let lightGreyBlue30: UIColor = getColor(colorName: "lightGreyBlue30")
    static let vibrantBlue: UIColor = getColor(colorName: "vibrantBlue")
    static let whiteTwo: UIColor = getColor(colorName: "whiteTwo")
    static let electricBlue: UIColor = getColor(colorName: "electricBlue")
    static let white: UIColor = getColor(colorName: "white")

    // To add new UIColor we have to use this function below
    static func getColor(colorName: String) -> UIColor {
        guard let color = UIColor(named: colorName) else {
            return UIColor()
        }
        return color
    }
}
