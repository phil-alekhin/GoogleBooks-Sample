//
//  BookListViewController.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

final class BookListViewController: UIViewController {
    var presenter: BookListPresenter!

    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        BookListAssembly.instance().inject(into: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewReady()
    }
}

// MARK: - BooksListView

extension BookListViewController: BookListView {}
