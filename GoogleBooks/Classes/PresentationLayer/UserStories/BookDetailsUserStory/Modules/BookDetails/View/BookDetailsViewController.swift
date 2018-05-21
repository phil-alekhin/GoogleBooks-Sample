//
//  BookDetailsViewController.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

final class BookDetailsViewController: UIViewController {
    var presenter: BookDetailsPresenter!
    var displayManager: BookDetailsDisplayManager!

    // MARK: IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        BookDetailsAssembly.instance().inject(into: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewReady()
    }
}

// MARK: BookDetailsView

extension BookDetailsViewController: BookDetailsView {
    func show(_ book: Book) {
        tableView.register(
            BookInfoTableViewCell.cellNib,
            forCellReuseIdentifier: BookInfoTableViewCell.cellIdentifier
        )

        tableView.register(
            BookDescriptionTableViewCell.cellNib,
            forCellReuseIdentifier: BookDescriptionTableViewCell.cellIdentifier
        )

        tableView.register(
            BookPublicationInfoTableViewCell.cellNib,
            forCellReuseIdentifier: BookPublicationInfoTableViewCell.cellIdentifier
        )

        tableView.dataSource = displayManager
        tableView.delegate = displayManager
        tableView.rowHeight = UITableViewAutomaticDimension

        displayManager.setup(with: book)
        tableView.reloadData()
    }
}

// MARK: - ModuleInputProvider

extension BookDetailsViewController: ModuleInputProvider {
    var moduleInput: ModuleInput? {
        // switlint:disable force_cast
        return presenter as? ModuleInput
    }
}
