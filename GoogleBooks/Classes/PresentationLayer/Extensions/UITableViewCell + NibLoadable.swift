//
//  UITableViewCell + NibLoadable.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

/// Describes a cell which provides a cell identifier and a cell UINib for registration
protocol NibLoadable {
    static var cellIdentifier: String { get }
    static var cellNib: UINib { get }
}

extension NibLoadable where Self: UITableViewCell {
    static var cellIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    static var cellNib: UINib {
        let nibName = NSStringFromClass(self).components(separatedBy: ".").last!
        return UINib(nibName: nibName, bundle: Bundle.main)
    }
}
