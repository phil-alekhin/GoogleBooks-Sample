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
    var displayManager: BookListDisplayManager!

    var searchController: UISearchController!
    var searchResultsController: UIViewController? {
        didSet {
            setupSearchController()
        }
    }

    // MARK: IBOutlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageView: UIView!

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

extension BookListViewController: BookListView {
    func showEmptyState() {
        tableView.isHidden = true
        messageView.isHidden = false
    }

    func show(_ books: [Book]) {
        tableView.isHidden = false
        messageView.isHidden = true

        tableView.register(BookTableViewCell.cellNib, forCellReuseIdentifier: BookTableViewCell.cellIdentifier)
        tableView.dataSource = displayManager
        tableView.delegate = displayManager

        displayManager.setup(with: tableView, books: books)
        displayManager.delegate = self

        tableView.reloadData()
    }
}

// MARK: - BookListDisplayManagerDelegate

extension BookListViewController: BookListDisplayManagerDelegate {
    func didTapCell(with book: Book) {

    }
}

// MARK: - UISearchBarDelegate

extension BookListViewController: UISearchBarDelegate {}

// MARK: - EmbedViewControllerSegueHolder

extension BookListViewController: EmbedViewControllerSegueHolder {

    func didObtain(viewController: UIViewController) {
        self.searchResultsController = viewController
    }
}
