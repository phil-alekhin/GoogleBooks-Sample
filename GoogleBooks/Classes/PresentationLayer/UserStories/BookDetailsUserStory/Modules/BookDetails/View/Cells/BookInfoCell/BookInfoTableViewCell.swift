//
//  BookInfoTableViewCell.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit
import Kingfisher

final class BookInfoTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!

    func update(with cellObject: BookInfoCellObject) {
        thumbnailImageView.kf.setImage(with: cellObject.thumbnailUrl)
        titleLabel.text = cellObject.title
        authorNameLabel.text = cellObject.author
    }
}
