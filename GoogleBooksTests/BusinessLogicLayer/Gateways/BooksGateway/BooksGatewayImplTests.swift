//
//  BooksGatewayImplTests.swift
//  GoogleBooksTests
//
//  Created by Philip Alekhin on 19/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import XCTest
import EasyDi
import OHHTTPStubs
@testable import GoogleBooks

class BooksGatewayImplTests: XCTestCase {
    var gateway: BooksGateway!

    override func setUp() {
        super.setUp()

        stubServerResponse()
        gateway = GatewayAssembly.instance().booksGateway
    }

    func testSuccefulObtainingBookList() {
        // given
        let testExpecation = expectation(description: "")

        var recievedBooks: [Book]?
        var actualError: Error?

        // when
        gateway.obtainBookList(queryString: "Лев") { result in
            switch result {
            case .success(let books):
                recievedBooks = books
            case .failure(let error):
                actualError = error
            }

            testExpecation.fulfill()
        }

        // then
        waitForExpectations(timeout: 0.3) { _ in
            XCTAssertNotNil(recievedBooks)
            XCTAssert(recievedBooks?.count == 2)

            XCTAssertNil(actualError)
        }
    }

    private func stubServerResponse() {
        stub(condition: isMethodGET()) { _ in
            let pathForFile = self.pathForResponseFile(with: "booksResponse_success", fileExtension: "json")
            return OHHTTPStubsResponse(fileAtPath: pathForFile, statusCode: 200, headers: nil)
        }
    }

    private func pathForResponseFile(with name: String, fileExtension: String) -> String {
        let testsBundle = Bundle(for: type(of: self))
        let testCaseBundleName = String(describing: type(of: self))

        guard
            let bundlePathForTestCase = testsBundle.path(forResource: testCaseBundleName, ofType: "bundle"),
            let testCaseBundle = Bundle(path: bundlePathForTestCase)
        else {
                fatalError("\(testCaseBundleName) was not found")
        }

        guard let filePathInBundle = OHPathForFileInBundle("\(name).\(fileExtension)", testCaseBundle) else {
            fatalError("\(name).\(fileExtension) file was not found")
        }

        return filePathInBundle
    }
}
