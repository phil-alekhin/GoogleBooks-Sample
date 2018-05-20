//
//  BooksListView.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

protocol BookListView: class {
    func show(_ books: [Book])
}
