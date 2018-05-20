//
//  BookListRouter.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

protocol BookListRouter {
    /// Initiates loading of BookSearch module
    func loadBookSearchModule(with moduleOutput: BookSearchModuleOutput)
}
