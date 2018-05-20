//
//  BookTableViewCell.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit
import Kingfisher

final class BookTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var publishedDateLabel: UILabel!

    static var cellIdentifier = "BookTableViewCell"

    func update(with cellObject: BookCellObject) {
        thumbnailImageView.kf.setImage(with: cellObject.thumbnail, options: [.transition(.fade(0.2))])
        titleLabel.text = cellObject.title
        publishedDateLabel.text = cellObject.publishedDate
    }
}
