//
//  PeopleDetailsUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 26.09.2021.
//

import Foundation

struct PeopleDetailsUIModel {
    let nameText: String
    let profilePath: String
    let bioText: String
    let bornText: String
    let bioButtonIsHide: Bool

    init(peopleDetailsResponseModel: PeopleDetailsResponseModel) {
        self.profilePath = peopleDetailsResponseModel.profilePath ?? ""
        self.nameText = peopleDetailsResponseModel.name

        // Setup Bio Button
        if peopleDetailsResponseModel.biography.isEmpty {
            self.bioButtonIsHide = true
        } else {
            self.bioButtonIsHide = false
        }

        self.bioText = peopleDetailsResponseModel.biography
        // Born Text
        if let birthday = peopleDetailsResponseModel.birthday, let placeOfBirth = peopleDetailsResponseModel.placeOfBirth {
            let bornString = "Born: \(birthday) in \(placeOfBirth)"
            self.bornText = bornString
        } else {
            self.bornText = ""
        }
    }
}
