//
//  BookDetailsAssembly.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import EasyDi

final class BookDetailsAssembly: Assembly {
    lazy var helpersAssembly: HelpersAssembly = self.context.assembly()

    var view: BookDetailsView & TransitionHandler {
        return definePlaceholder()
    }

    var displayManager: BookDetailsDisplayManager {
        return define(
            init: BookDetailsDisplayManager(
                bookDetailsCellObjectFactory: self.cellObjectFactory
            )
        )
    }

    var cellObjectFactory: BookDetailsCellObjectFactory {
        return define(
            init: BookDetailsCellObjectFactory(
                datesFormatter: self.helpersAssembly.datesFormatter
            )
        )
    }

    var presenter: BookDetailsPresenter {
        return define(
            init: BookDetailsPresenterImpl(
                view: self.view
            )
        )
    }

    func inject(into viewController: BookDetailsViewController) {
        return defineInjection(key: "view", into: viewController) {
            $0.presenter = self.presenter
            $0.displayManager = self.displayManager
            return $0
        }
    }
}
