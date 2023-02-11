// NetworkServiceProtocol.swift
// Copyright © Ilentiy. All rights reserved.

/// Протокол сетевого слоя
protocol NetworkServiceProtocol {
    func fetchMovies(category: Category, completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchMovieDetails(id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void)
}
