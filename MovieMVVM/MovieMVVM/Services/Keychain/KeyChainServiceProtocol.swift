// KeyChainServiceProtocol.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Протокол сервиса хранения критических данных пользователя
protocol KeyChainServiceProtocol {
    func getValue(_ key: String) -> String
    func setValue(_ value: String, forKey: String)
}
