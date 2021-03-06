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
    private weak var bookSearchModuleInput: BookSearchModuleInput?
    private let router: BookListRouter
    private let getBooksUseCase: GetBooksUseCase

    init(view: BookListView, router: BookListRouter, getBooksUseCase: GetBooksUseCase) {
        self.view = view
        self.router = router
        self.getBooksUseCase = getBooksUseCase
    }

    func viewReady() {
        router.loadBookSearchModule(with: self)

        let cachedBooks = getBooksUseCase.getBooksFromCache()
        if cachedBooks.isEmpty {
            view?.showEmptyState()
        } else {
            view?.show(cachedBooks)
        }
    }

    func didChangeSearchBar(with queryString: String) {
        bookSearchModuleInput?.update(with: queryString)
    }

    func didSelectCell(with book: Book) {
        router.showBookDetailsModule(with: book)
    }
}

// MARK: - BookSearchModuleOutput

extension BookListPresenterImpl: BookSearchModuleOutput {
    func didLoad(bookSearchModule: BookSearchModuleInput) {
        bookSearchModuleInput = bookSearchModule
    }

    func didSelect(_ book: Book) {
        router.showBookDetailsModule(with: book)
    }
}
