//
//  AppDelegate.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 18/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        UIViewController.swizzlePerformSegue()
        return true
    }
}
