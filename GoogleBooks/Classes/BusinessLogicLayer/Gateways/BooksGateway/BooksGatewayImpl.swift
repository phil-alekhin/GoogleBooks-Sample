//
//  BooksGatewayImpl.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

final class BooksGatewayImpl: BooksGateway {
    private let requestConfigurator: RequestConfigurator
    private let networkClient: NetworkClient
    private let jsonMapper: JSONMapper<BookListResponse>
    private let persistanceManager: UserDefaultsPersistanceManager

    init(
        requestConfigurator: RequestConfigurator,
        networkClient: NetworkClient,
        jsonMapper: JSONMapper<BookListResponse>,
        persistanceManager: UserDefaultsPersistanceManager
    ) {
        self.requestConfigurator = requestConfigurator
        self.networkClient = networkClient
        self.jsonMapper = jsonMapper
        self.persistanceManager = persistanceManager
    }

    func obtainBookList(queryString: String, completionHandler: @escaping BooksGatewayCompletionHandler) {
        let booksRequest = createBooksRequest(with: queryString)

        networkClient.send(request: booksRequest) { response, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }

            guard let responseData = response?.data else {
                return
            }

            do {
                let bookListResponse = try self.jsonMapper.map(with: responseData)
                let books = bookListResponse.volumes?.map { $0.book } ?? []
                completionHandler(.success(books))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }

    func saveBooksToCache(_ books: [Book]) {
        let booksKey = "books"
        persistanceManager.save(object: books, key: booksKey)
    }

    func getBooksFromCache() -> [Book] {
        let booksKey = "books"
        let books: [Book] = persistanceManager.get(with: booksKey) ?? []
        return books
    }

    private func createBooksRequest(with queryString: String) -> URLRequest {
        var requestData = RequestDataModel()
        requestData.queryParameters = ["q": queryString]

        return requestConfigurator.request(method: .get, pathComponents: ["volumes"], requestDataModel: requestData)
    }
}
