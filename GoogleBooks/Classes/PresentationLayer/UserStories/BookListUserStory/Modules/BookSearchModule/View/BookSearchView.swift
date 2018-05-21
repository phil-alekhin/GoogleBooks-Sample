//
//  BookSearchView.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

protocol BookSearchView: class {
    func updateLoadingState(isLoading: Bool)

    func updateView(with books: [Book])

    func showEmptyState()
}
