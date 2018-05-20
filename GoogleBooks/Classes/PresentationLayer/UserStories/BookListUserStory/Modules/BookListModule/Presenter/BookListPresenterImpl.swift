//
//  BooksListPresenterImpl.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

final class BookListPresenterImpl: BookListPresenter {
    private weak var view: BookListView?
    private let getBooksUseCase: GetBooksUseCase

    init(view: BookListView, getBooksUseCase: GetBooksUseCase) {
        self.view = view
        self.getBooksUseCase = getBooksUseCase
    }

    func viewReady() {
        let cachedBooks = getBooksUseCase.getBooksFromCache()
        if cachedBooks.isEmpty {
            view?.showEmptyState()
        } else {
            view?.show(cachedBooks)
        }
    }
}
