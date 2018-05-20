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

    var view: BookSearchView & TransitionHandler {
        return definePlaceholder()
    }

    var presenter: BookSearchPresenter {
        return define(
            init: BookSearchPresenterImpl(
                view: self.view,
                getBooksUseCase: self.useCaseAssembly.booksGateway
            )
        )
    }

    func inject(into viewController: BookSearchViewController) {
        return defineInjection(key: "view", into: viewController) {
            $0.presenter = self.presenter
            return $0
        }
    }
}
