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

    var searchController: UISearchController!
    var searchResultsController: UIViewController? {
        didSet {
            setupSearchController()
        }
    }

    // MARK: IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        BookListAssembly.instance().inject(into: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewReady()
    }

    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true

        searchController.searchBar.placeholder = "Search for books"
        searchController.searchBar.delegate = self

        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }

        definesPresentationContext = true
    }
}

// MARK: - BooksListView

extension BookListViewController: BookListView {}
// MARK: - BookListDisplayManagerDelegate

extension BookListViewController: BookListDisplayManagerDelegate {
    func didTapCell(with book: Book) {

    }
}

// MARK: - UISearchBarDelegate

extension BookListViewController: UISearchBarDelegate {}
