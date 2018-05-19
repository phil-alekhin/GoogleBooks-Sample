//
//  RequestConfigurator.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

/// Describes an object that are responsible for configuring URLRequest
/// from parameters
protocol RequestConfigurator {
    /// Returns preconfigured URLRequest
    ///
    /// - parameters:
    ///     - method: HTTP method name
    ///     - pathComponents: Array that describes path to API resource
    ///     - requestDataModel: The model containing http headers, body and query
    ///
    /// - returns: URLRequest instance
    func request(method: HTTPMethod, pathComponents: [String], requestDataModel: RequestDataModel?) -> URLRequest
}
