//
//  DatesFormatter.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

/// Converts a date object to a string with specific format
final class DatesFormatter {
    /// Used to obtain string from date with "d MMM yyyy" format
    ///
    /// - parameter date: Date object
    /// - returns: Formatted date string
    func obtainDateWithDayMonthYearFormat(date: Date) -> String {
        let dateFormat = "d MMM yyyy"
        return formattedDateString(with: dateFormat, andDate: date)
    }

    /// Used to obtain date from string with "yyyy-MM-dd" format
    func obtainDate(from string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.date(from: string)
    }

    private func formattedDateString(with format: String, andDate date: Date) -> String {
        let deviceLanguage = Locale.preferredLanguages.first!
        let locale = Locale(identifier: deviceLanguage)

        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = format

        return dateFormatter.string(from: date)
    }
}
