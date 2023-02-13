// MovieDetailViewModelTest.swift
// Copyright © Ilentiy. All rights reserved.

@testable import MovieMVVM
import XCTest

/// Тест вью модели экрана  детали фильма
final class MovieDetailViewModelTest: XCTestCase {
    // MARK: - Private Properties

    private var movieDetailViewModel: MovieDetailsViewModelProtocol?

    // MARK: - Public Methods

    override func setUp() {
        movieDetailViewModel = MovieDetailsViewModel(
            networkService: MockNetworkService(),
            imageService: MockImageService(),
            coreDataService: MockCoreDataService(),
            movieId: 0
        )
    }

    override func tearDown() {
        movieDetailViewModel = nil
    }

    func testLoadData() {
        XCTAssertNoThrow(
            movieDetailViewModel?.loadData()
        )
    }

    func testLoadImageData() {
        movieDetailViewModel?.loadImageData(url: "", completion: { result in
            switch result {
            case let .success(data):
                XCTAssertEqual(data, Data())
            case let .failure(error):
                XCTAssertNotNil(error)
            }
        })
    }
}
