//
//  UserDefaultsPersistenceManager.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation
import DefaultsKit

final class UserDefaultsPersistanceManager {
    private let defaultsManager: Defaults

    init(defaultsManager: Defaults = .init()) {
        self.defaultsManager = defaultsManager
    }

    func save<T: Codable>(object: T, key: String) {
        let keyForObject = Key<T>(key)
        defaultsManager.set(object, for: keyForObject)
    }

    func get<T: Codable>(with key: String) -> T? {
        let keyForObject = Key<T>(key)
        return defaultsManager.get(for: keyForObject)
    }
}
