//
//  BookDetailsView.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

protocol BookDetailsView: class {
    /// Triggers a view to show book
    func show(_ book: Book)
}
