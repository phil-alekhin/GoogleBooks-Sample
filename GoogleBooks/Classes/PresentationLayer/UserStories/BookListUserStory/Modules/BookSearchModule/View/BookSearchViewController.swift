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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

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

extension BookSearchViewController: BookSearchView {
    func updateLoadingState(isLoading: Bool) {
        if isLoading {
            tableView.isHidden = true
            activityIndicator.startAnimating()
            return
        }

        tableView.isHidden = false
        activityIndicator.stopAnimating()
    }
}

// MARK: - ModuleInputProvider

extension BookSearchViewController: ModuleInputProvider {
    var moduleInput: ModuleInput? {
        // switlint:disable force_cast
        return presenter as? ModuleInput
    }
}
