//
//  BookSearchPresenter.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

protocol BookSearchPresenter {
    /// Informs that a view ready
    func viewReady()

    /// Informs that a book was selected
    func didSelect(_ book: Book)
}
