// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Сетевой слой
final class NetworkService: NetworkServiceProtocol {
    private enum Constants {
        static let baseURL = "https://api.themoviedb.org/3/movie/"
        static let imagePathUrl = "https://image.tmdb.org/t/p/w500"

        enum ParametersKey {
            static let apiKey = "api_key"
            static let language = "language"
        }

        enum ParametersValue {
            static let language = "ru-RU"
        }
    }

    // MARK: - Private Properties

    // MARK: - Public Methods

    func fetchMovieDetails(id: Int, completion: @escaping (Result<MovieDetails, Error>) -> Void) {
        guard
            let url = URL(string: BaseURL.movies + "\(id)" + BaseURL.apiKey)
        else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data)
                    completion(.success(movieDetails))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    func fetchMovies(category: Category, completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard
            let url = URL(string: "\(BaseURL.movies)\(category.categoryString)\(BaseURL.apiKey)")
        else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            do {
                let movies = try JSONDecoder().decode(Results.self, from: data).movies
                completion(.success(movies))
            } catch {
                print(error)
            }
        }.resume()
    }
}
