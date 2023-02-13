// AssemblyBuilderTest.swift
// Copyright © Ilentiy. All rights reserved.

@testable import MovieMVVM
import XCTest

final class AssemblyBuilderTest: XCTestCase {
    private var builder: AssemblyBuilderProtocol?

    override func setUp() {
        builder = AssemblyModuleBuilder()
    }

    func testMakeMoviesTableView() {
        let movieListViewController = builder?.makeMoviesTableView()
        XCTAssertTrue(movieListViewController is MoviesListTableViewController)
    }

    func testMakeMovieDetailView() {
        let movieDetailViewController = builder?.makeMovieDetailsTableView(movieId: 0)
        XCTAssertTrue(movieDetailViewController is MovieDetailsTableViewController)
    }
}
