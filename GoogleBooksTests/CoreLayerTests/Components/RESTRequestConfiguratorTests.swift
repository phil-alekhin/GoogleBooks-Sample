//
//  RESTRequestConfiguratorTests.swift
//  GoogleBooksTests
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import XCTest
@testable import GoogleBooks

class RESTRequestConfiguratorTests: XCTestCase {

    var requestConfigurator: RESTRequestConfigurator!

    override func setUp() {
        super.setUp()

        let baseURL = URL(string: "https://someapi.com")!
        requestConfigurator = RESTRequestConfigurator(baseURL: baseURL)
    }

    override func tearDown() {
        requestConfigurator = nil

        super.tearDown()
    }

    func testThatConfiguratorCreatesSimpleRequest() {
        // given
        let expectedURLPath = "https://someapi.com/users"

        // when
        let result = requestConfigurator.request(method: .get, pathComponents: ["users"], requestDataModel: nil)

        // then
        XCTAssert(result.httpMethod == "GET")
        XCTAssert(expectedURLPath == result.url?.absoluteString)
    }

    func testThatConfiguratorCreatesRequestWithQuery() {
        // given
        let expectedURLPath = "https://someapi.com/?key1=value1&key2=value2"

        var requestData = RequestDataModel()
        requestData.queryParameters = generateRequestParameters()

        // when
        let result = requestConfigurator.request(method: .get, pathComponents: [], requestDataModel: requestData)

        // then
        XCTAssert(expectedURLPath == result.url?.absoluteString)
    }

    func testThatConfiguratorCreatesRequestBody() {
        // given
        let expectedURLPath = "https://someapi.com/users"

        var requestData = RequestDataModel()
        requestData.body = genereateBodyData()

        // when
        let result = requestConfigurator.request(method: .post, pathComponents: ["users"], requestDataModel: requestData)

        // then
        XCTAssert(result.httpMethod == "POST")
        XCTAssert(result.url?.absoluteString == expectedURLPath)
        XCTAssert(result.httpBody == requestData.body)
    }

    func testThatConfiguratorCreatesRequestWithHeaders() {
        // given
        var requestData = RequestDataModel()
        requestData.httpHeaderFields = ["Accept": "application/json"]

        // when
        let result = requestConfigurator.request(method: .get, pathComponents: [], requestDataModel: requestData)

        // then
        XCTAssert(result.allHTTPHeaderFields! == requestData.httpHeaderFields!)
    }

    // MARK: Helpers

    func generateRequestParameters() -> [String: String] {
        return ["key1": "value1", "key2": "value2"]
    }

    func genereateBodyData() -> Data {
        let data = "some string".data(using: .utf8)!
        return data
    }
}
