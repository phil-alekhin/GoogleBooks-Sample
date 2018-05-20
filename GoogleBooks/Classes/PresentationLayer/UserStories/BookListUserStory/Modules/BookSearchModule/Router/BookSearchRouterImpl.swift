//
//  BookSearchRouterImpl.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

final class BookSearchRouterImpl: BookSearchRouter {
    private weak var transitionHandler: TransitionHandler?

    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }

    func showError(with message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        (transitionHandler as? UIViewController)?.present(alertController, animated: true, completion: nil)
    }
}
