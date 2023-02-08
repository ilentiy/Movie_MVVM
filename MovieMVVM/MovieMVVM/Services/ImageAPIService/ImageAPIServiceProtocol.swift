// ImageAPIServiceProtocol.swift
// Copyright © Ilenty. All rights reserved.

import Foundation

/// Протокол сервиса получения даты изображения из сети
protocol ImageAPIServiceProtocol {
    func fetchPhotoData(imagePath: String, completion: @escaping (Result<Data, Error>) -> Void)
}
