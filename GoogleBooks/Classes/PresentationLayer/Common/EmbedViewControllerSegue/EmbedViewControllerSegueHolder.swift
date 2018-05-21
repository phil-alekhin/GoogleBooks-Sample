//
//  EmbedViewControllerSegueHolder.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

/// Protocol for a view controller which should store view controller
protocol EmbedViewControllerSegueHolder {
    func didObtain(viewController: UIViewController)
}
