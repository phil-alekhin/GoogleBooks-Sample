//
//  Result.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

enum Result<T> {
    case success(T)
    case failure(Error)
}
