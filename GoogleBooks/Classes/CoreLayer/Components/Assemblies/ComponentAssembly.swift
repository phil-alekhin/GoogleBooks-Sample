//
//  ComponentAssembly.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import EasyDi

final class ComponentAssembly: Assembly {
    var networkClient: NetworkClient {
        return define(
            scope: .lazySingleton,
            init: CommonNetworkClient(urlSession: .shared),
            inject: nil
        )
    }

    var restRequestConfigurator: RequestConfigurator {
        let baseUrl = URL(string: "https://www.googleapis.com/books/v1")!

        return define(
            scope: .lazySingleton,
            init: RESTRequestConfigurator(baseURL: baseUrl),
            inject: nil
        )
    }

    var bookResponseMapper: JSONMapper<BookListResponse> {
        return define(scope: .lazySingleton, init: JSONMapper<BookListResponse>(), inject: nil)
    }

    var userDefaultsPersistanceManager: UserDefaultsPersistanceManager {
        return define(scope: .lazySingleton, init: UserDefaultsPersistanceManager(), inject: nil)
    }
}
