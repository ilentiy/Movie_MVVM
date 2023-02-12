// MockNetworkService.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation
@testable import MovieMVVM

/// Мок сетевого слоя
final class MockNetworkService: NetworkServiceProtocol {
    // MARK: - Private Enum

    private enum Constants {
        static let emptyString = ""
        static let mockMovieName = "MockMovie"
        static let mockMovieDetailsName = "MockMovieDetails"
        static let results = "results"
        static let extensionFile = "json"
    }

    // MARK: - Public Methods

    func fetchMovies(category: MovieMVVM.Category, completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let jsonURL = Bundle.main.path(forResource: Constants.mockMovieName, ofType: Constants.extensionFile)
        else { return }
        do {
            let fileURL = URL(fileURLWithPath: jsonURL)
            let data = try Data(contentsOf: fileURL)
            let result = try JSONDecoder().decode(Results.self, from: data).movies
            completion(.success(result))
        } catch {
            completion(.failure(error))
        }
    }

    func fetchMovieDetails(id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        guard let jsonURL = Bundle.main.path(
            forResource: Constants.mockMovieDetailsName,
            ofType: Constants.extensionFile
        ) else { return }
        do {
            let fileURL = URL(fileURLWithPath: jsonURL)
            let data = try Data(contentsOf: fileURL)
            let result = try JSONDecoder().decode(MovieDetail.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(error))
        }
    }
}
