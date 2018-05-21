//
//  BookDetailsPresenterImpl.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

final class BookDetailsPresenterImpl: BookDetailsPresenter {
    private weak var view: BookDetailsView?
    private var book: Book!

    init(view: BookDetailsView) {
        self.view = view
    }

    func viewReady() {
        view?.show(book)
    }
}

// MARK: - BookDetailsModuleInput

extension BookDetailsPresenterImpl: BookDetailsModuleInput {
    func setup(with book: Book) {
        self.book = book
    }
}
