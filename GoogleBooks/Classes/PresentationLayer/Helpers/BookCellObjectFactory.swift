//
//  BookCellObjectFactory.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

final class BookCellObjectFactory {
    private let datesFormatter: DatesFormatter

    init(datesFormatter: DatesFormatter) {
        self.datesFormatter = datesFormatter
    }

    func cellObjects(from books: [Book]) -> [BookCellObject] {
        return books.map { book in
            var publishedDateString = ""
            if let publishedDate = book.publishedDate {
               publishedDateString = tryToFormat(publishedDate: publishedDate)
            }

            return BookCellObject(
                thumbnail: book.thumbnails.thumbnail,
                title: book.title,
                publishedDate: publishedDateString,
                book: book
            )
        }
    }

    private func tryToFormat(publishedDate: String) -> String {
        guard let date = datesFormatter.obtainDate(from: publishedDate) else {
            return publishedDate
        }

        let prefix = "Дата публикации: "
        return prefix + datesFormatter.obtainDateWithDayMonthYearFormat(date: date)
    }
}
