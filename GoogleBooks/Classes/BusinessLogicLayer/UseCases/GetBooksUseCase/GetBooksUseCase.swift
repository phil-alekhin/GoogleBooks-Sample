//
//  GetBooksUseCase.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 18/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

typealias GetBooksCompletionHandler = (Result<[Book]>) -> Void

protocol GetBooksUseCase {
    /// Returns book list by sending request to server
    ///
    /// - parameters:
    ///     - queryString: Search query string
    ///     - completionHandler: Block called upon completion the method, and returns Error if there is any
    func getBooks(queryString: String, completionHandler: @escaping GetBooksCompletionHandler)

    /// Returns book list from cache
    ///
    /// - returns: An array of Book
    func getBooksFromCache() -> [Book]
}
