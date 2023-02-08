// ImageServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол кэш сервиса
protocol ImageServiceProtocol {
    func getImage(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
