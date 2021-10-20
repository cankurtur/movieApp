//
//  PeopleResponseModel.swift
//  movieApp
//
//  Created by Can Kurtur on 26.09.2021.
//

import Foundation

struct PeopleDetailsResponseModel: Codable {
    let name: String
    let biography: String
    let birthday: String?
    let placeOfBirth: String?
    let profilePath: String?

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case biography = "biography"
        case birthday = "birthday"
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
    }
}
