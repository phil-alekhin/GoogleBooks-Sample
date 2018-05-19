//
//  BooksGateway.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

typealias GetBooksGatewayCompletionHandler = (Result<[Book]>) -> Void

protocol GetBooksGateway {
    /// Obtains book list by sending request to server
    ///
    /// - parameters:
    ///     - queryString: Search query string
    ///     - completionHandler: Block called upon completion the method, and returns Error if there is any
    func obtainBookList(queryString: String, completionHandler: @escaping GetBooksGatewayCompletionHandler)
}
