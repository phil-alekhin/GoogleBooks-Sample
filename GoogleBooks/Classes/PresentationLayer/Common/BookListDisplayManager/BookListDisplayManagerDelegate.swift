//
//  BookListDisplayManagerDelegate.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

protocol BookListDisplayManagerDelegate: class {
    /// Notifes a delegate that a cell with book was tapped
    ///
    /// - parameter book: Book struct
    func didTapCell(with book: Book)
}
