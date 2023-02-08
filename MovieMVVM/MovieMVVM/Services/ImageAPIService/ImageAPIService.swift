// ImageAPIService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Сервис получения даты изображения из сети
final class ImageAPIService: ImageAPIServiceProtocol {
    // MARK: - Private Enum

    private enum Constants {
        static let imagePathUrl = "https://image.tmdb.org/t/p/w500"
    }

    // MARK: - Public Methods

    func fetchPhotoData(imagePath: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageURL = URL(string: "\(Constants.imagePathUrl)\(imagePath)") else { return }
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }
        .resume()
    }
}
