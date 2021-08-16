//
//  UIFontExtension.swift
//  movieApp
//
//  Created by Can Kurtur on 14.08.2021.
//

import UIKit

extension UIFont {
    static let headline1 = getSFText(.bold, size: 34)
    static let headline2 = getSFText(.bold, size: 22)
    static let headline3 = getSFText(.bold, size: 20)
    static let body1 = getSFText(.regular, size: 15)
    static let body2 = getSFText(.regular, size: 12)
    static let point = getSFText(.black, size: 10)

    public enum OpenSFProType: String {
        case bold = "-Bold"
        case regular = "-Regular"
        case black = "-Black"
    }
    static func getSFText(_ type: OpenSFProType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        UIFont(name: "SFProDisplay\(type.rawValue)", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
