//
//  BookDetailsAssembly.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import EasyDi

final class BookDetailsAssembly: Assembly {
    var view: BookDetailsView & TransitionHandler {
        return definePlaceholder()
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
            return $0
        }
    }
}
