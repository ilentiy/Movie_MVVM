// NetworkService.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Сетевой слой
final class NetworkService: NetworkServiceProtocol {
    // MARK: - Private Properties

    private var keychainService: KeyChainServiceProtocol?

    // MARK: - Init

    init(keychainService: KeyChainServiceProtocol) {
        self.keychainService = keychainService
    }

    // MARK: - Public Methods

    func fetchMovieDetails(id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: "\(UrlRequest.baseURL)\(id)") else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: UrlRequest.apiKey, value: keychainService?.getValue(Constants.keyText)),
            URLQueryItem(name: UrlRequest.languageKey, value: UrlRequest.languageValue)
        ]
        guard let url = urlComponents.url else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let movieDetails = try JSONDecoder().decode(MovieDetail.self, from: data)
                    completion(.success(movieDetails))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        .resume()
    }

    func fetchMovies(category: Category, completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard var urlComponents = URLComponents(string: "\(UrlRequest.baseURL)\(category.category)") else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: UrlRequest.apiKey, value: keychainService?.getValue(Constants.keyText)),
            URLQueryItem(name: UrlRequest.languageKey, value: UrlRequest.languageValue)
        ]
        guard let url = urlComponents.url else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            do {
                let movies = try JSONDecoder().decode(Results.self, from: data).movies
                completion(.success(movies))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
