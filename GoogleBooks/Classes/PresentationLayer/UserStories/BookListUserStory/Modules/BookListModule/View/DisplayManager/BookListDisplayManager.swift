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

    private var viewModel: [BookCellObject] = []

    func setup(with tableView: UITableView, books: [Book]) {
        self.tableView = tableView
        viewModel = books.map { book in
            return BookCellObject(
                thumbnail: book.thumbnails.thumbnail,
                title: book.title,
                publishedDate: book.publishedDate ?? "",
                book: book)
        }
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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}

// MARK: - UITableViewDelegate

extension BookListDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellObject = viewModel[indexPath.row]
        delegate?.didTapCell(with: cellObject.book)
    }
}
