// ImageServiceProtocol.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Протокол кэш сервиса
protocol ImageServiceProtocol {
    func getImage(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
