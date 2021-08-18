//
//  UIColorExtension.swift
//  movieApp
//
//  Created by Can Kurtur on 9.08.2021.
//

import UIKit

extension UIColor {
    // MARK: - Properties
    static let almostBlack = Colors.almostBlack
    static let lightGreyBlue30 = Colors.lightGreyBlue30
    static let vibrantBlue = Colors.vibrantBlue
    static let whiteTwo = Colors.whiteTwo
    static let electricBlue = Colors.electricBlue
    static let white = Colors.white

    // MARK: - Business Logic
    static func getColor(colorName: String) -> UIColor {
        guard let color = UIColor(named: colorName) else {
            return .white
        }
        return color
    }
}
