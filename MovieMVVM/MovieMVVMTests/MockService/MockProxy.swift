// MockProxy.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation
@testable import MovieMVVM

/// Мок прокси
final class MockProxy: ProxyProtocol {
    // MARK: - Public Methods

    func loadImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        let data = Data()
        completion(.success(data))
    }
}
