//
//  CommonComponentAssembly.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import EasyDi

final class CommonComponentAssembly: Assembly {
    lazy var helpersAssembly: HelpersAssembly = self.context.assembly()

    var bookListDisplayManager: BookListDisplayManager {
        return define(
            init: BookListDisplayManager(
                cellObjectFactory: self.helpersAssembly.bookCellObjectFactory
            )
        )
    }
}
