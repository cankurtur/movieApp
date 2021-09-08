//
//  MovieGenreUserDefaults.swift
//  movieApp
//
//  Created by Can Kurtur on 8.09.2021.
//

import Foundation

class MovieGenresUserDefaults {
    var userDefaults = UserDefaults.standard

    func setUserDefault(value: [String: String], key: String) {
        userDefaults.setValue(value, forKey: key)
    }

    func getUserDefault(key: String) -> [String: String] {
        if let object = userDefaults.object(forKey: key) {
            return object as? [String: String] ?? ["": ""]
        } else {
            return ["": ""]
        }
    }

    func checkUserDefault(key: String) -> Bool {
        if userDefaults.dictionary(forKey: key) != nil {
            return true
        } else {
            return false
        }
    }

    func deleteUserDefault(key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
