//
//  BookDetailsDisplayManager.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

final class BookDetailsDisplayManager: NSObject {
    private var bookDetailsCellObjectFactory: BookDetailsCellObjectFactory!
    private var viewModel: [Any] = []

    init(bookDetailsCellObjectFactory: BookDetailsCellObjectFactory) {
        super.init()
        self.bookDetailsCellObjectFactory = bookDetailsCellObjectFactory
    }

    func setup(with book: Book) {
        viewModel = bookDetailsCellObjectFactory.cellObjects(from: book)
    }

    // MARK: Private

    private func bookInfoCell(
        tableView: UITableView,
        cellObject: BookInfoCellObject
        ) -> BookInfoTableViewCell {

        let bookInfoCell: BookInfoTableViewCell = dequeueCell(
            tableView: tableView,
            cellIdentifier: BookInfoTableViewCell.cellIdentifier
        )
        bookInfoCell.update(with: cellObject)

        return bookInfoCell
    }

    private func bookDescriptionCell(
        tableView: UITableView,
        cellObject: BookDescriptionCellObject
        ) -> BookDescriptionTableViewCell {

        let bookDescriptionCell: BookDescriptionTableViewCell = dequeueCell(
            tableView: tableView,
            cellIdentifier: BookDescriptionTableViewCell.cellIdentifier
        )
        bookDescriptionCell.update(with: cellObject)

        return bookDescriptionCell
    }

    private func bookPublicationInfoCell(
        tableView: UITableView,
        cellObject: BookPublicationCellObject
        ) -> BookPublicationInfoTableViewCell {

        let bookPublicationCell: BookPublicationInfoTableViewCell = dequeueCell(
            tableView: tableView,
            cellIdentifier: BookPublicationInfoTableViewCell.cellIdentifier
        )
        bookPublicationCell.update(with: cellObject)

        return bookPublicationCell
    }

    private func dequeueCell<CellType: UITableViewCell>(tableView: UITableView, cellIdentifier: String) -> CellType {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CellType else {
            fatalError()
        }

        return cell
    }
}

// MARK: - UITableViewDataSource

extension BookDetailsDisplayManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellObject = viewModel[indexPath.row]

        switch cellObject {
        case let bookInfoCellObject as BookInfoCellObject:
            return bookInfoCell(tableView: tableView, cellObject: bookInfoCellObject)

        case let bookDescriptionCellObject as BookDescriptionCellObject:
            return bookDescriptionCell(tableView: tableView, cellObject: bookDescriptionCellObject)

        case let bookPublicationCellObject as BookPublicationCellObject:
            return bookPublicationInfoCell(tableView: tableView, cellObject: bookPublicationCellObject)
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension BookDetailsDisplayManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellObject = viewModel[indexPath.row]

        switch cellObject {
        case is BookPublicationCellObject:
            return 85
        default:
            return UITableViewAutomaticDimension
        }
    }
}
