// MovieListViewModelTest.swift
// Copyright © Ilentiy. All rights reserved.

@testable import MovieMVVM
import XCTest

/// Тест вью модели экрана список фильмов
final class MovieListViewModelTest: XCTestCase {
    // MARK: - Private Properties

    private let coreDataService = MockCoreDataService()
    private let mockMovie: [Movie] = []
    private var movieListViewModel: MovieListViewModelProtocol?

    // MARK: - Public Methods

    override func setUp() {
        movieListViewModel = MoviesListViewModel(
            networkService: MockNetworkService(),
            imageService: MockImageService(),
            keychainService: MockKeyChainService(),
            coreDataService: coreDataService
        )
    }

    override func tearDown() {
        movieListViewModel = nil
    }

    func testFetchMovieList() {
        XCTAssertNoThrow(
            movieListViewModel?.fetchMovieList()
        )
    }

    func testFetchMoviesType() {
        XCTAssertNoThrow(
            movieListViewModel?.fetchMoviesType(index: 0)
        )
    }

    func testKeyChainInfo() {
        XCTAssertNotNil(movieListViewModel?.keychainInfo())
    }

    func testLoadImageData() {
        movieListViewModel?.loadImageData(url: "", completion: { result in
            switch result {
            case let .success(data):
                XCTAssertEqual(data, Data())
            case let .failure(error):
                XCTAssertNotNil(error)
            }
        })
    }
}
