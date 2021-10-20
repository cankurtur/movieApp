//
//  LocalizableUILabelExtension.swift
//  movieApp
//
//  Created by Can Kurtur on 18.08.2021.
//

import UIKit

protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

extension UILabel: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { nil }
        set(key) {
            text = key?.localized
        }
    }
}
