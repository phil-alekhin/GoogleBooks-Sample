//
//  BookDescriptionTableViewCell.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

final class BookDescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!

    func update(with cellObject: BookDescriptionCellObject) {
        descriptionLabel.text = cellObject.description
    }
}
