//
//  Book.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 18/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

struct Book: Equatable, Decodable {
    struct BookThumbnails: Equatable, Decodable {
        let smallThumbnail: URL
        let thumbnail: URL
    }

    let title: String
    var description: String?
    var authors: [String]?

    var publisher: String?
    var publishedDate: String?

    let thumbnails: BookThumbnails

    enum CodingKeys: String, CodingKey {
        case title
        case authors
        case publisher
        case publishedDate
        case description
        case thumbnails = "imageLinks"
    }
}

// MARK: Additional init method

extension Book {
    init(title: String, thumbnails: BookThumbnails) {
        self.title = title
        self.thumbnails = thumbnails
    }
}
