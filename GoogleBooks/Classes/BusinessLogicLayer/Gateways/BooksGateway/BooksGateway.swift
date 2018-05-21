//
//  BooksGateway.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

typealias BooksGatewayCompletionHandler = (Result<[Book]>) -> Void

protocol BooksGateway {
    /// Obtains book list by sending request to server
    ///
    /// - parameters:
    ///     - queryString: Search query string
    ///     - completionHandler: Block called upon completion the method, and returns Error if there is any
    func obtainBookList(queryString: String, completionHandler: @escaping BooksGatewayCompletionHandler)

    /// Saves book list using a persistance manager
    ///
    /// - parameter books: Book list
    func saveBooksToCache(_ books: [Book])

    /// Returns book list from cache
    func getBooksFromCache() -> [Book]
}
