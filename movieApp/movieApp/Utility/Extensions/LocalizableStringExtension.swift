//
//  LocalizableStringExtension.swift
//  movieApp
//
//  Created by Can Kurtur on 18.08.2021.
//

import UIKit

protocol Localizable {
    var localized: String { get }
}

// swiftlint:disable nslocalizedstring_key
extension String: Localizable {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
// swiftlint:enable: nslocalizedstring_key
}
