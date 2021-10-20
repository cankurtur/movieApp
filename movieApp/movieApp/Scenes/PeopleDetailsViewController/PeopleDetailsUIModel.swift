//
//  PeopleDetailsUIModel.swift
//  movieApp
//
//  Created by Can Kurtur on 26.09.2021.
//


import Foundation

struct PeopleDetailsUIModel {
    // Init DateFormatManager
    var dateFormatManager = DateFormatManager()

    // MARK: - Properties
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
            // Format Date
            let formattedDate = dateFormatManager.formatStringToDate(string: birthdayString)
            let resultOfBirthday = dateFormatManager.formatDateToStringWithFullMonthName(date: formattedDate)
            let bornString = "\(resultOfBirthday) in \(placeOfBirth)"
            self.bornText = bornString
            self.bornLabelIsHide = false
        } else {
            self.bornText = ""
            self.bornLabelIsHide = true
        }
    }
}
