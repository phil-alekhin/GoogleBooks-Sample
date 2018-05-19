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

    var view: BookListView {
        return definePlaceholder()
    }

    var presenter: BookListPresenter {
        return define(
            init: BookListPresenterImpl(
                view: self.view,
                getBooksUseCase: self.useCaseAssembly.booksGateway
            ),
            inject: nil
        )
    }

    func inject(into viewController: BookListViewController) {
        return defineInjection(key: "view", into: viewController) {
            $0.presenter = self.presenter
            return $0
        }
    }
}
