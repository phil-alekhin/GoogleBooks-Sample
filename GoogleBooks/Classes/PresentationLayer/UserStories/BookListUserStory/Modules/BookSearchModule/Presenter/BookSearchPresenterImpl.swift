//
//  BookSearchPresenterImpl.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

final class BookSearchPresenterImpl: BookSearchPresenter {
    private weak var view: BookSearchView?
    private weak var moduleOutput: BookSearchModuleOutput?
    private let router: BookSearchRouter
    private let getBooksUseCase: GetBooksUseCase

    init(view: BookSearchView, router: BookSearchRouter, getBooksUseCase: GetBooksUseCase) {
        self.view = view
        self.router = router
        self.getBooksUseCase = getBooksUseCase
    }

    func viewReady() {

    }
}

// MARK: - BookSearchModuleInput

extension BookSearchPresenterImpl: BookSearchModuleInput {

    func configure(with moduleOutput: BookSearchModuleOutput) {
        self.moduleOutput = moduleOutput
        self.moduleOutput?.didLoad(bookSearchModule: self)
    }

    func update(with searchString: String) {
        view?.updateLoadingState(isLoading: true)
        getBooksUseCase.getBooks(queryString: searchString) { [weak view, router] result in
            view?.updateLoadingState(isLoading: false)

            switch result {
            case .success(let books):
                if books.isEmpty {
                    view?.showEmptyState()
                    return
                }

                view?.updateView(with: books)
            case .failure(let error):
                router.showError(with: error.localizedDescription)
            }
        }
    }
}
