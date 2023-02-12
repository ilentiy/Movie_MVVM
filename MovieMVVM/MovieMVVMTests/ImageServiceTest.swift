// ImageServiceTest.swift
// Copyright © Ilentiy. All rights reserved.

@testable import MovieMVVM
import XCTest

/// Тест сервиса изображений
final class ImageServiceTest: XCTestCase {
    // MARK: - Private Properties

    private var imageService: ImageServiceProtocol?

    // MARK: - Public Methods

    override func setUp() {
        imageService = ImageService()
    }

    override func tearDown() {
        imageService = nil
    }

    func testGetImage() {
        imageService?.getImage(url: "", completion: { result in
            switch result {
            case let .success(success):
                XCTAssertNotNil(success)
            case let .failure(failure):
                XCTAssertNil(failure)
            }
        })
    }
}
