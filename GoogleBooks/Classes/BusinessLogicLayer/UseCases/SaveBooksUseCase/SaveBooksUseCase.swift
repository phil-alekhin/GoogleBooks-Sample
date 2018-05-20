//
//  SaveBooksUseCase.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

protocol SaveBooksUseCase {
    /// Saves books to cache
    ///
    /// - parameter books: An array of Book structs
    func save(books: [Book])
}
