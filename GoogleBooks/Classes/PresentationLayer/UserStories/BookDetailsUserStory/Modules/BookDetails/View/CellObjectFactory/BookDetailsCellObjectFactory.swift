//
//  BookDetailsCellObjectFactory.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 21/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

final class BookDetailsCellObjectFactory {
    private let datesFormatter: DatesFormatter

    init(datesFormatter: DatesFormatter) {
        self.datesFormatter = datesFormatter
    }

    func cellObjects(from book: Book) -> [Any] {
        var cellObjects = [Any]()

        let bookInfoCellObject = BookInfoCellObject(
            thumbnailUrl: book.thumbnails?.thumbnail,
            title: book.title,
            author: book.authors?.first
        )
        cellObjects.append(bookInfoCellObject)

        if let description = book.description {
            let bookDescriptionCellObject = BookDescriptionCellObject(description: description)
            cellObjects.append(bookDescriptionCellObject)
        }

        if let publishedDate = book.publishedDate {
            let formattedPublishedDate = tryToFormat(publishedDate: publishedDate)
            let bookPublicationCellObject = BookPublicationCellObject(publishedDate: formattedPublishedDate)
            cellObjects.append(bookPublicationCellObject)
        }

        return cellObjects
    }

    private func tryToFormat(publishedDate: String) -> String {
        guard let date = datesFormatter.obtainDate(from: publishedDate) else {
            return publishedDate
        }

        return datesFormatter.obtainDateWithDayMonthYearFormat(date: date)
    }
}
