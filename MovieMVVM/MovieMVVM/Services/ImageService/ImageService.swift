// ImageService.swift
// Copyright © Ilenty. All rights reserved.

import Foundation

/// Сервис по кэшированию изображений
final class ImageService: ImageServiceProtocol {
    // MARK: - Private Properties

    private let imageAPIService = ImageAPIService()
    private let fileManagerService = FileManagerService()

    // MARK: - Public Methods

    func getImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let proxy = Proxy(imageAPIServise: imageAPIService, fileManagerService: fileManagerService)
        proxy.loadImage(url: url) { result in
            switch result {
            case let .success(data):
                completion(.success(data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
