// MockImageAPIService.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation
@testable import MovieMVVM

/// Мок сервиса изображений АПИ
final class MockImageAPIService: ImageAPIServiceProtocol {
    // MARK: - Public Methods

    func fetchPhotoData(imagePath: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let data = Data()
        completion(.success(data))
    }
}
