// MockImageService.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation
@testable import MovieMVVM

/// Мок Сервиса изображения
final class MockImageService: ImageServiceProtocol {
    // MARK: - Public Methods

    func getImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let data = Data()
        completion(.success(data))
    }
}
