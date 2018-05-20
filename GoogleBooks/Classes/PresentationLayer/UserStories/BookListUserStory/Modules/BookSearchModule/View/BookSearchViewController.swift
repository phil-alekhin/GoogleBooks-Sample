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
    var displayManager: BookListDisplayManager!
    
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(BookTableViewCell.cellNib, forCellReuseIdentifier: BookTableViewCell.cellIdentifier)
        }
    }
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

    func updateView(with books: [Book]) {
        tableView.dataSource = displayManager
        tableView.delegate = displayManager

        displayManager.setup(with: tableView, books: books)
        displayManager.delegate = self

        tableView.reloadData()
    }
}

// MARK: - BookListDisplayManagerDelegate

extension BookSearchViewController: BookListDisplayManagerDelegate {
    func didTapCell(with book: Book) {

    }
}

// MARK: - ModuleInputProvider

extension BookSearchViewController: ModuleInputProvider {
    var moduleInput: ModuleInput? {
        // switlint:disable force_cast
        return presenter as? ModuleInput
    }
}
