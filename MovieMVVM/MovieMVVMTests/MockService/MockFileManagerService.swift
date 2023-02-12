// MockFileManagerService.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation
@testable import MovieMVVM

/// Мок файлового менеджера
final class MockFileManagerService: FileManagerServiceProtocol {
    // MARK: - Public Methods

    func saveImageDrive(url: String, data: Data) {}

    func getImageDrive(url: String) -> Data? {
        Data()
    }
}
