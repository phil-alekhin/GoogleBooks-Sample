//
//  BooksListPresenter.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

protocol BookListPresenter {
    /// Informs presenter that a view ready
    func viewReady()

    /// Notifies presenter that a user has change a search string
    func didChangeSearchBar(with queryString: String)

    /// Notifies presenter that a book was selected
    func didSelectCell(with book: Book)
}
