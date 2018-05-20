//
//  BookSearchAssembly.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import EasyDi

final class BookSearchAssembly: Assembly {
    lazy var useCaseAssembly: UseCaseAssembly = self.context.assembly()
    lazy var commonComponentsAssembly: CommonComponentAssembly = self.context.assembly()

    var view: BookSearchView & TransitionHandler {
        return definePlaceholder()
    }

    var presenter: BookSearchPresenter {
        return define(
            init: BookSearchPresenterImpl(
                view: self.view,
                router: self.router,
                getBooksUseCase: self.useCaseAssembly.booksGateway,
                saveBooksUseCase: self.useCaseAssembly.saveBooksUseCase
            )
        )
    }

    var router: BookSearchRouter {
        return define(
            init: BookSearchRouterImpl(
                transitionHandler: self.view
            )
        )
    }

    func inject(into viewController: BookSearchViewController) {
        return defineInjection(key: "view", into: viewController) {
            $0.presenter = self.presenter
            $0.displayManager = self.commonComponentsAssembly.bookListDisplayManager
            return $0
        }
    }
}
