//
//  GetBooksUseCaseMock.swift
//  GoogleBooksTests
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation
@testable import GoogleBooks

final class GetBooksUseCaseMock: GetBooksUseCase {
    var getBooksReturnValue: Result<[Book]>!
    func getBooks(queryString: String, completionHandler: @escaping GetBooksCompletionHandler) {
        completionHandler(getBooksReturnValue)
    }

    var getBooksFromCacheReturnValue: [Book]!
    func getBooksFromCache() -> [Book] {
        return getBooksFromCacheReturnValue
    }
}
