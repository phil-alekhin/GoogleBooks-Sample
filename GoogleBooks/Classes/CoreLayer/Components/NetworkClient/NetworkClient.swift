//
//  NetworkClient.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

typealias NetworkClientCompletionBlock = (_ responseModel: ServerResponseModel?, _ error: Error?) -> Void

protocol NetworkClient {
    func send(request: URLRequest, completionBlock: NetworkClientCompletionBlock?)
}
