// NetworkServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол сетевого слоя
protocol NetworkServiceProtocol {
    // MARK: - Public Methods

    func fetchMovies(category: Category, completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchMovieDetails(id: Int, completion: @escaping (Result<MovieDetails, Error>) -> Void)
}
