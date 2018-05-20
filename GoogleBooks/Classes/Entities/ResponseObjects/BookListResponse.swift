//
//  BookListResponse.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

struct BookListResponse: Decodable {
    struct Volume: Decodable {
        let book: Book

        enum CodingKeys: String, CodingKey {
            case book = "volumeInfo"
        }
    }

    var volumes: [Volume]? = []

    enum CodingKeys: String, CodingKey {
        case volumes = "items"
    }
}
