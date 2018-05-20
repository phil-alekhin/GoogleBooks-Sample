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

    // MARK: Actions

    @objc func didChangeSearchBar() {
        presenter.didChangeSearchBar(with: searchController.searchBar.text!)
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
        presenter.didSelectCell(with: book)
    }
}

// MARK: - UISearchBarDelegate

extension BookListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count < 3 {
            return
        }

        NSObject.cancelPreviousPerformRequests(
            withTarget: self,
            selector: #selector(didChangeSearchBar),
            object: nil
        )

        self.perform(
            #selector(didChangeSearchBar),
            with: nil,
            afterDelay: 0.5
        )
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
}

// MARK: - EmbedViewControllerSegueHolder

extension BookListViewController: EmbedViewControllerSegueHolder {

    func didObtain(viewController: UIViewController) {
        self.searchResultsController = viewController
    }
}
