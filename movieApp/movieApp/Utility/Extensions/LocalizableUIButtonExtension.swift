//
//  LocalizableUIButtonExtension.swift
//  movieApp
//
//  Created by Can Kurtur on 18.08.2021.
//

import UIKit

extension UIButton: XIBLocalizable {
    @IBInspectable var xibLocKey: String? {
        get { nil }
        set(key) {
            setTitle(key?.localized, for: .normal)
        }
   }
}
