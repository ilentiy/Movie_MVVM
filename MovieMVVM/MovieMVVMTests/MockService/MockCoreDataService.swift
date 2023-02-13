// MockCoreDataService.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation
@testable import MovieMVVM

/// Мок кордата сервиса
final class MockCoreDataService: CoreDataServiceProtocol {
    // MARK: - Private Properties

    private var movies: [Movie]?
    private var movieDetail: MovieDetail?

    // MARK: - Public Methods

    func saveMoviesData(movies: [MovieMVVM.Movie], category: String) {
        self.movies = movies
    }

    func getMoviesData(category: String, completion: @escaping (Result<[MovieMVVM.Movie], Error>) -> Void) {
        guard let movies = movies else { return }
        completion(.success(movies))
    }

    func saveMovieDetail(movie: MovieMVVM.MovieDetail) {
        movieDetail = movie
    }

    func getMovieDetailData(movieId: Int, completion: @escaping (Result<MovieMVVM.MovieDetail, Error>) -> Void) {
        guard let movieDetail = movieDetail else { return }
        completion(.success(movieDetail))
    }
}
