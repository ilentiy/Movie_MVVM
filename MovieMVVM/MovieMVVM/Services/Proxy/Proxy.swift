// Proxy.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Прокси
final class Proxy: ProxyProtocol {
    // MARK: - Public Properties

    let imageAPIService: ImageAPIServiceProtocol
    let fileManagerService: FileManagerServiceProtocol

    // MARK: - Init

    init(imageAPIServise: ImageAPIServiceProtocol, fileManagerService: FileManagerServiceProtocol) {
        imageAPIService = imageAPIServise
        self.fileManagerService = fileManagerService
    }

    // MARK: - Public Methods

    func loadImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let image = fileManagerService.getImageDrive(url: url) else {
            imageAPIService.fetchPhotoData(imagePath: url) { result in
                switch result {
                case let .success(data):
                    self.fileManagerService.saveImageDrive(url: url, data: data)
                case let .failure(error):
                    completion(.failure(error))
                }
            }
            return
        }
        completion(.success(image))
    }
}
