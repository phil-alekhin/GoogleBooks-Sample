//
//  BookPublicationInfoTableViewCell.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

final class BookPublicationInfoTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var publishedDateLabel: UILabel!

    func update(with cellObject: BookPublicationCellObject) {
        publishedDateLabel.text = cellObject.publishedDate
    }
}
