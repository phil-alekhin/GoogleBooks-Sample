//
//  BookListPresenterTests.swift
//  GoogleBooksTests
//
//  Created by Philip Alekhin on 20/05/2018.
//  Copyright © 2018 Philip Alekhin. All rights reserved.
//

import XCTest
@testable import GoogleBooks

class BookListPresenterTests: XCTestCase {
    var presenter: BookListPresenterImpl!
    var viewMock: BookListViewMock!
    var getBooksUseCaseMock: GetBooksUseCaseMock!

    override func setUp() {
        super.setUp()

        getBooksUseCaseMock = GetBooksUseCaseMock()
        viewMock = BookListViewMock()
        presenter = BookListPresenterImpl(view: viewMock, getBooksUseCase: getBooksUseCaseMock)
    }

    func testPresenterTriggersViewToShowEmptyState() {
        // given
        getBooksUseCaseMock.getBooksFromCacheReturnValue = []

        // when
        presenter.viewReady()

        // then
        XCTAssert(viewMock.showEmptyStateCallsCount == 1)
    }

    func testPresenterTriggersViewToShowBookList() {
        // given
        let expectedBookList = createTestData()
        getBooksUseCaseMock.getBooksFromCacheReturnValue = expectedBookList

        // when
        presenter.viewReady()

        // then
        XCTAssertEqual(viewMock.showBooksRecievedBooks, expectedBookList)
        XCTAssert(viewMock.showBooksRecievedBooks?.count == 1)

    }

    private func createTestData() -> [Book] {
        let thumbnails = Book.BookThumbnails(
            smallThumbnail: URL(fileURLWithPath: ""),
            thumbnail: URL(fileURLWithPath: "")
        )

        let book = Book(title: "Some book", thumbnails: thumbnails)
        return [book]
    }
}

// MARK: - Mocks

extension BookListPresenterTests {
    class BookListViewMock: BookListView {
        var showEmptyStateCallsCount = 0
        func showEmptyState() {
            showEmptyStateCallsCount += 1
        }

        var showBooksRecievedBooks: [Book]?
        func show(_ books: [Book]) {
            showBooksRecievedBooks = books
        }
    }
}
