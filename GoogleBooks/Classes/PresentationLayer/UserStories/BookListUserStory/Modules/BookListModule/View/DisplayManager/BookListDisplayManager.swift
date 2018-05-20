//
//  BookListDisplayManager.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

final class BookListDisplayManager: NSObject {
    weak var tableView: UITableView?
    weak var delegate: BookListDisplayManagerDelegate?

    private var cellObjectFactory: BookCellObjectFactory!
    private var viewModel: [BookCellObject] = []

    init(cellObjectFactory: BookCellObjectFactory) {
        super.init()
        self.cellObjectFactory = cellObjectFactory
    }

    func setup(with tableView: UITableView, books: [Book]) {
        self.tableView = tableView
        tableView.estimatedRowHeight = 115
        tableView.rowHeight = UITableViewAutomaticDimension

        viewModel = cellObjectFactory.cellObjects(from: books)
    }
}

// MARK: - UITableViewDataSource

extension BookListDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = BookTableViewCell.cellIdentifier
        guard let bookCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? BookTableViewCell else {
            fatalError()
        }

        let cellObject = viewModel[indexPath.row]
        bookCell.update(with: cellObject)

        return bookCell
    }
}

// MARK: - UITableViewDelegate

extension BookListDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellObject = viewModel[indexPath.row]
        delegate?.didTapCell(with: cellObject.book)
    }
}
