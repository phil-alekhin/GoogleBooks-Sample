//
//  TransitionHandler.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

typealias ConfigrationBlock<M> = (M) -> Void

protocol TransitionHandler: class {
    func performSegue(with segueIdentifier: String)

    func openModule<M>(with segueIdentifier: String, configurationBlock: @escaping ConfigrationBlock<M>)

    func closeCurrentModule()
}
