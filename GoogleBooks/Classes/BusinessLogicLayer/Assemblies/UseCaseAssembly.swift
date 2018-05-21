//
//  UseCaseAssembly.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import EasyDi

final class UseCaseAssembly: Assembly {
    lazy var gatewayAssembly: GatewayAssembly = self.context.assembly()

    var getBooksUseCase: GetBooksUseCase {
        return define(
            scope: .lazySingleton,
            init: GetBooksUseCaseImpl(
                booksGateway: self.gatewayAssembly.booksGateway
            ),
            inject: nil
        )
    }

    var saveBooksUseCase: SaveBooksUseCase {
        return define(
            scope: .lazySingleton,
            init: SaveBooksUseCaseImpl(
                booksGateway: self.gatewayAssembly.booksGateway
            ),
            inject: nil
        )
    }
}
