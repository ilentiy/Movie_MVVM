// ImageAPIServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол сервиса получения даты изображения из сети
protocol ImageAPIServiceProtocol {
    // MARK: - Public Methods

    func fetchPhotoData(imagePath: String, completion: @escaping (Result<Data, Error>) -> Void)
}
