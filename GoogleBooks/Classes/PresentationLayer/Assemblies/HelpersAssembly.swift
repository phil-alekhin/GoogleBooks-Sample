//
//  HelpersAssembly.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import EasyDi

final class HelpersAssembly: Assembly {
    var datesFormatter: DatesFormatter {
        return define(init: DatesFormatter())
    }

    var bookCellObjectFactory: BookCellObjectFactory {
        return define(
            init: BookCellObjectFactory(datesFormatter: self.datesFormatter)
        )
    }
}
