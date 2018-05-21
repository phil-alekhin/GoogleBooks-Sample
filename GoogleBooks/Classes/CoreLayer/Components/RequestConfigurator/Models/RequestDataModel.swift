//
//  RequestDataModel.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

struct RequestDataModel {
    var httpHeaderFields: [String: String]?
    var queryParameters: [String: String]?
    var body: Data?
}
