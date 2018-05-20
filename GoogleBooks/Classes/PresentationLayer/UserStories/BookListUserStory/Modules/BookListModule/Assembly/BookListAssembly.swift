//
//  BookListAssembly.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import EasyDi

final class BookListAssembly: Assembly {
    lazy var useCaseAssembly: UseCaseAssembly = self.context.assembly()
    lazy var helpersAssembly: HelpersAssembly = self.context.assembly()

    var view: BookListView {
        return definePlaceholder()
    }

    var displayManager: BookListDisplayManager {
        return define(
            init: BookListDisplayManager(
                cellObjectFactory: self.helpersAssembly.bookCellObjectFactory
            )
        )
    }

    var presenter: BookListPresenter {
        return define(
            init: BookListPresenterImpl(
                view: self.view,
                router: self.router,
                getBooksUseCase: self.useCaseAssembly.booksGateway
            ),
            inject: nil
        )
    }

    var router: BookListRouter {
        return define(init: BookListRouterImpl())
    }

    func inject(into viewController: BookListViewController) {
        return defineInjection(key: "view", into: viewController) {
            $0.presenter = self.presenter
            $0.displayManager = self.displayManager
            return $0
        }
    }
}
