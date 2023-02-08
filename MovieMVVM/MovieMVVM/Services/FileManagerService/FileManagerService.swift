// FileManagerService.swift
// Copyright © Ilenty. All rights reserved.

import Foundation

/// Сервис файлового менеджера
final class FileManagerService: FileManagerServiceProtocol {
    // MARK: - Constants

    private enum Constants {
        static let folderName = "MoviesImages"
        static let separatorCharacter = "/"
        static let defaultString: Substring = "default"
        static let pngText = ".png"
        static let defaultImageName = "photo"
    }

    // MARK: - Public Methods

    func getImageDrive(url: String) -> Data? {
        guard let filePath = getImagePath(url: url) else { return nil }
        let fileNameURL = URL(filePath: filePath)
        let data = try? Data(contentsOf: fileNameURL)
        return data
    }

    func saveImageDrive(url: String, data: Data) {
        guard let filePath = getImagePath(url: url) else { return }
        FileManager.default.createFile(atPath: filePath, contents: data)
    }

    // MARK: - Private Methods

    private func getImagePath(url: String) -> String? {
        guard let folderUrl = getCacheFolderPath() else { return nil }
        let fileName = String(url.split(separator: Constants.separatorCharacter).last ?? Constants.defaultString)
        return folderUrl.appendingPathComponent("\(fileName)\(Constants.pngText)").path
    }

    private func getCacheFolderPath() -> URL? {
        guard let docsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else { return nil }
        let url = docsDirectory.appendingPathComponent(Constants.folderName, isDirectory: true)
        if !FileManager.default.fileExists(atPath: url.path) {
            try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        }
        return url
    }
}
