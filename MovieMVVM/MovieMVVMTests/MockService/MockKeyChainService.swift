// MockKeyChainService.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation
@testable import MovieMVVM

/// Мок кейчейна
final class MockKeyChainService: KeyChainServiceProtocol {
    // MARK: - Private Properties

    private var token = ""

    // MARK: - Public Methods

    func getValue(_ key: String) -> String {
        token
    }

    func setValue(_ value: String, forKey: String) {
        token = value
    }
}
