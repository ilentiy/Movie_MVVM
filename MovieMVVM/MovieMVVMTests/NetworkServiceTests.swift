// NetworkServiceTests.swift
// Copyright © Ilentiy. All rights reserved.

@testable import MovieMVVM
import XCTest

/// Тест Сетевого слоя
final class NetworkServiceTests: XCTestCase {
    // MARK: - Private Properties

    private var networkService: NetworkServiceProtocol?
    private var movies: [Movie]?
    private var movieDetail: MovieDetail?

    // MARK: - Private Methods

    override func setUp() {
        networkService = NetworkService(keychainService: KeyChainService())
    }

    override func tearDown() {
        networkService = nil
    }

    func testFetchMovies() {
        networkService?.fetchMovies(category: .popular) { [weak self] result in
            switch result {
            case let .success(movies):
                XCTAssertEqual(movies.count, 20)
                self?.movies = movies
                XCTAssertNotNil(self?.movies)
            case let .failure(failure):
                XCTAssertNotNil(failure)
            }
        }
    }

    func testFetchMovieDetail() {
        networkService?.fetchMovieDetails(id: 10) { [weak self] result in
            switch result {
            case let .success(movieDetail):
                self?.movieDetail = movieDetail
                XCTAssertNotNil(movieDetail)
            case let .failure(failure):
                XCTAssertNotNil(failure)
            }
        }
    }
}
