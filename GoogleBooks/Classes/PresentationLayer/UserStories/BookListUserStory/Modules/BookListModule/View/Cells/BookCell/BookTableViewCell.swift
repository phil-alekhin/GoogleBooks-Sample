//
//  BookTableViewCell.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

final class BookTableViewCell: UITableViewCell {
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var publishedDateLabel: UILabel!

    static var cellIdentifier = "BookTableViewCell"

    func update(with cellObject: BookCellObject) {
        titleLabel.text = cellObject.title
        publishedDateLabel.text = cellObject.publishedDate
    }
}
