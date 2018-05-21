//
//  EmbedViewControllerSegue.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

/// Used to embed search results controller into UISearchController of another view controller
final class EmbedViewControllerSegue: UIStoryboardSegue {

    override func perform() {
        guard let holder = source as? EmbedViewControllerSegueHolder else {
            fatalError("\(source.debugDescription) doesn't conforms to EmbedViewControllerSegueHolder protocol")
        }

        holder.didObtain(viewController: destination)
    }
}
