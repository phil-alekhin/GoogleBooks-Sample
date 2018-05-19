//
//  CommonNetworkClient.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

final class CommonNetworkClient: NetworkClient {
    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    func send(request: URLRequest, completionBlock: NetworkClientCompletionBlock?) {
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let block = completionBlock else {
                return
            }

            guard let serverResponse = response as? HTTPURLResponse else {
                block(nil, error)
                return
            }

            var responseModel = ServerResponseModel()
            responseModel.response = serverResponse
            responseModel.data = data

            block(responseModel, error)
        }

        task.resume()
    }
}
