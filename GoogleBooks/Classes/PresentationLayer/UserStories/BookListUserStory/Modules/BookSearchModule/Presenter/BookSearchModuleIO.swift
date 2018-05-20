//
//  BookSearchModuleIO.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

protocol BookSearchModuleInput {
    /// Configures the module with an object which conforms to BookSearchModuleOutput protocol
    func configure(with moduleOutput: BookSearchModuleOutput)

    /// Updates query string
    func update(with queryString: String)
}

protocol BookSearchModuleOutput: class {
    /// Informs that BookSearchModule was loaded
    ///
    /// - parameter eventsSearchModule: Presenter of BookSearch module
    func didLoad(bookSearchModule: BookSearchModuleInput)

    /// Notifies a module output that a book was selected
    func didSelect(_ book: Book)
}
