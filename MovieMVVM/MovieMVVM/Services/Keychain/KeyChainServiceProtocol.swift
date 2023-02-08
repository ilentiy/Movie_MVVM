// KeyChainServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол сервиса хранения критических данных пользователя
protocol KeyChainServiceProtocol {
    func getAPIKey(_ key: String) -> String
    func saveAPIKey(_ value: String, forKey: String)
}
