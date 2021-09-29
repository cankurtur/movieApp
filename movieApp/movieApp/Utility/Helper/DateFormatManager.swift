//
//  DateFormatManager.swift
//  movieApp
//
//  Created by Can Kurtur on 29.09.2021.
//

import Foundation

struct DateFormatManager {
    let dateFormatter = DateFormatter()

    func formatStringToDate(string: String) -> Date {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let resultDate = dateFormatter.date(from: string) else { return Date() }
        return resultDate
    }  

    func formatDateToString(date: Date) -> String {
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let resultString = dateFormatter.string(from: date)
        return resultString
    }

    func formatDateToStringWithFullMonthName(date: Date) -> String {
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let resultString = dateFormatter.string(from: date)
        return resultString
    }
}
