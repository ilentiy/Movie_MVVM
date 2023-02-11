// KeyChainService.swift
// Copyright © Ilentiy. All rights reserved.

import KeychainSwift

/// Сервис для сохранения критических данных
final class KeyChainService: KeyChainServiceProtocol {
    // MARK: - Private properties

    private let keychain = KeychainSwift()

    // MARK: - Public methods

    func getValue(_ key: String) -> String {
        guard let keyValue = keychain.get(key) else { return String() }
        return keyValue
    }

    func setValue(_ value: String, forKey: String) {
        keychain.set(value, forKey: forKey)
    }
}
