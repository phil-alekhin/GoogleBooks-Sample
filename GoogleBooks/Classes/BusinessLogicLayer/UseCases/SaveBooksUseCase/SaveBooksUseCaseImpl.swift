//
//  SaveBooksUseCaseImpl.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

final class SaveBooksUseCaseImpl: SaveBooksUseCase {
    private let booksGateway: BooksGateway

    init(booksGateway: BooksGateway) {
        self.booksGateway = booksGateway
    }

    func save(books: [Book]) {
        booksGateway.saveBooksToCache(books)
    }
}
