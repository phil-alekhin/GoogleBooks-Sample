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

    func loadBookSearchModule() {
        transitionHandler?.performSegue(with: BookListSegue.bookListToBookSearch)
    }
}
