// FileManagerServiceTest.swift
// Copyright © Ilentiy. All rights reserved.

@testable import MovieMVVM
import XCTest

/// Тест сервиса файлового менеджера
final class FileManagerServiceTest: XCTestCase {
    // MARK: - Private Enum

    private enum Constants {
        static let mockURL = "data"
        static let mockNumber = 1
    }

    // MARK: - Private Properties

    private var fileManagerService: FileManagerServiceProtocol?

    private var mockDdata = Data(count: Constants.mockNumber)
    private var data: Data?

    // MARK: - Public Methods

    override func setUp() {
        fileManagerService = FileManagerService()
    }

    override func tearDown() {
        fileManagerService = nil
    }

    func testSaveImage() {
        XCTAssertNoThrow(
            fileManagerService?.saveImageDrive(url: "data", data: mockDdata)
        )
    }

    func testGetImageDrive() {
        data = fileManagerService?.getImageDrive(url: "data")
        XCTAssertNotNil(data)
    }
}
