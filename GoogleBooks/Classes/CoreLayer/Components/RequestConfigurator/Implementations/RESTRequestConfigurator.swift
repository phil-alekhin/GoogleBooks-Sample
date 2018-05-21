//
//  RESTRequestConfigurator.swift
//  GoogleBooks
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import Foundation

final class RESTRequestConfigurator: RequestConfigurator {
    private let baseURL: URL

    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    // MARK: RequestConfigurator

    func request(method: HTTPMethod, pathComponents: [String], requestDataModel: RequestDataModel?) -> URLRequest {
        var url = generateURL(with: pathComponents)

        if let queryParameters = requestDataModel?.queryParameters {
            url = serialize(url: url, with: queryParameters)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = requestDataModel?.httpHeaderFields
        request.httpBody = requestDataModel?.body

        return request
    }

    // MARK: Helpers

    private func generateURL(with pathComponents: [String]) -> URL {
        var urlPath = pathComponents.joined(separator: "/")
        urlPath = urlPath.replacingOccurrences(of: "//", with: "/")

        let finalURL = baseURL.appendingPathComponent(urlPath)
        return finalURL
    }

    private func serialize(url: URL, with parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = []

        parameters.reversed().forEach { (key, value) in
            let queryItem = URLQueryItem(name: key, value: value)
            urlComponents.queryItems?.append(queryItem)
        }

        return urlComponents.url!
    }
}
