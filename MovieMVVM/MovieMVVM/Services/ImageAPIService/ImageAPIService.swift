// ImageAPIService.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Сервис получения даты изображения из сети
final class ImageAPIService: ImageAPIServiceProtocol {
    // MARK: - Public Methods

    func fetchPhotoData(imagePath: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageURL = URL(string: "\(UrlRequest.baseImageURL)\(imagePath)") else { return }
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
