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

    // MARK: IBOutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewReady()
    }
}

// MARK: BookDetailsView

extension BookDetailsViewController: BookDetailsView {
    func show(_ book: Book) {

    }
}
