// FileManagerServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол сервиса файлового менеджера
protocol FileManagerServiceProtocol {
    // MARK: - Public Methods

    func saveImageDrive(url: String, data: Data)
    func getImageDrive(url: String) -> Data?
}
