//
//  BookSearchViewController.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

final class BookSearchViewController: UIViewController {
    var presenter: BookSearchPresenter!

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        BookSearchAssembly.instance().inject(into: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - BookSearchView

extension BookSearchViewController: BookSearchView {}

// MARK: - ModuleInputProvider

extension BookSearchViewController: ModuleInputProvider {
    var moduleInput: ModuleInput? {
        // switlint:disable force_cast
        return presenter as? ModuleInput
    }
}
