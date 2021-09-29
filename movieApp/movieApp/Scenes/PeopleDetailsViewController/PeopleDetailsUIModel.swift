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
    let bornLabelIsHide: Bool

    init(peopleDetailsResponseModel: PeopleDetailsResponseModel) {
        self.profilePath = peopleDetailsResponseModel.profilePath ?? ""
        self.nameText = peopleDetailsResponseModel.name

        self.bioText = peopleDetailsResponseModel.biography

        // Born Text
        if let birthday = peopleDetailsResponseModel.birthday, let placeOfBirth = peopleDetailsResponseModel.placeOfBirth {
            let birthdayString = birthday
            var resultOfBirthday = ""
            let dateFormatterToDate = DateFormatter()
            dateFormatterToDate.dateFormat = "yyyy-MM-dd"
            if let formattedDate = dateFormatterToDate.date(from: birthdayString) {
                let dateFormatterToString = DateFormatter()
                dateFormatterToString.dateFormat = "MMMM dd, yyyy"
                resultOfBirthday = dateFormatterToString.string(from: formattedDate)
            }

            let bornString = "\(resultOfBirthday) in \(placeOfBirth)"
            self.bornText = bornString
            self.bornLabelIsHide = false
        } else {
            self.bornText = ""
            self.bornLabelIsHide = true
        }
    }
}
