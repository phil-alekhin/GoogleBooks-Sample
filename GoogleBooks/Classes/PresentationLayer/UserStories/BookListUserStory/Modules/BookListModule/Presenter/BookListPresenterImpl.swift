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
    private let router: BookListRouter
    private let getBooksUseCase: GetBooksUseCase

    init(view: BookListView, router: BookListRouter, getBooksUseCase: GetBooksUseCase) {
        self.view = view
        self.router = router
        self.getBooksUseCase = getBooksUseCase
    }

    func viewReady() {
        router.loadBookSearchModule()

        let cachedBooks = getBooksUseCase.getBooksFromCache()
        if cachedBooks.isEmpty {
            view?.showEmptyState()
        } else {
            view?.show(cachedBooks)
        }
    }
}
