//
//  GatewayAssembly.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import EasyDi

final class GatewayAssembly: Assembly {
    lazy var componentAssembly: ComponentAssembly = self.context.assembly()

    var booksGateway: BooksGateway {
        return define(
            scope: .lazySingleton,
            init: BooksGatewayImpl(
                requestConfigurator: self.componentAssembly.restRequestConfigurator,
                networkClient: self.componentAssembly.networkClient,
                jsonMapper: self.componentAssembly.bookResponseMapper,
                persistanceManager: self.componentAssembly.userDefaultsPersistanceManager
            ),
            inject: nil
        )
    }
}
