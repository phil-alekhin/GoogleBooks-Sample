//
//  BookListRouterImpl.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

final class BookListRouterImpl: BookListRouter {
    private weak var transitionHandler: TransitionHandler?

    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }

    func loadBookSearchModule(with moduleOutput: BookSearchModuleOutput) {
        transitionHandler?.openModule(
            with: BookListSegue.bookListToBookSearch,
            configurationBlock: { (moduleInput: BookSearchModuleInput) in
                moduleInput.configure(with: moduleOutput)
            }
        )
    }

    func showBookDetailsModule(with book: Book) {
        transitionHandler?.openModule(
            with: BookListSegue.bookListToBookDetails,
            configurationBlock: { (moduleInput: BookDetailsModuleInput) in
                moduleInput.setup(with: book)
            }
        )
    }
}
