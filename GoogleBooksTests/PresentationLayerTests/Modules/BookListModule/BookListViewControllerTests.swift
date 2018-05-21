//
//  BookListViewControllerTests.swift
//  GoogleBooksTests
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import XCTest
@testable import GoogleBooks

class BookListViewControllerTests: XCTestCase {
    var viewController: BookListViewController!
    var presenterMock: BookListPresenterMock!

    override func setUp() {
        super.setUp()

        viewController = BookListViewController()

        presenterMock = BookListPresenterMock()
        viewController.presenter = presenterMock
    }

    func testViewControllerCallsPresenterOnViewDidLoad() {
        // given

        // when
        viewController.viewDidLoad()

        // then
        XCTAssert(presenterMock.viewReadyCallsCount == 1)
    }
}

// MARK: - Mocks

extension BookListViewControllerTests {
    class BookListPresenterMock: BookListPresenter {
        var viewReadyCallsCount = 0
        func viewReady() {
            viewReadyCallsCount += 1
        }

        var didChangeSearchBarQueryString: String?
        func didChangeSearchBar(with queryString: String) {
            didChangeSearchBarQueryString = queryString
        }

        var didSelectCellBook: Book?
        func didSelectCell(with book: Book) {
            didSelectCellBook = book
        }
    }
}
