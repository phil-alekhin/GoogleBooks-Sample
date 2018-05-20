//
//  BookDetailsModuleInput.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

protocol BookDetailsModuleInput: ModuleInput {
    /// Setups module with a book
    func setup(with book: Book)
}
