// ProxyTest.swift
// Copyright © Ilentiy. All rights reserved.

@testable import MovieMVVM
import XCTest

/// Тест прокси
final class ProxyTest: XCTestCase {
    // MARK: - Private Properties

    private let imageAPIService = MockImageAPIService()
    private let fileManagerService = MockFileManagerService()
    private var proxy: ProxyProtocol?

    // MARK: - Private Methods

    override func setUp() {
        proxy = Proxy(
            imageAPIServise: imageAPIService,
            fileManagerService: fileManagerService
        )
    }

    func testGetImage() {
        proxy?.loadImage(url: "", completion: { result in
            switch result {
            case let .success(success):
                XCTAssertNotNil(success)
            case let .failure(failure):
                XCTAssertNil(failure)
            }
        })
    }
}
