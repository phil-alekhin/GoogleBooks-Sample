//
//  GetBooksUseCaseImpl.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

final class GetBooksUseCaseImpl: GetBooksUseCase {
    private let booksGateway: BooksGateway

    init(booksGateway: BooksGateway) {
        self.booksGateway = booksGateway
    }

    func getBooks(queryString: String, completionHandler: @escaping GetBooksCompletionHandler) {
        booksGateway.obtainBookList(queryString: queryString) { result in
            completionHandler(result)
        }
    }
}
