// NetworkServiceProtocol.swift
// Copyright © Ilenty. All rights reserved.

/// Протокол сетевого слоя
protocol NetworkServiceProtocol {
    var keychainService: KeyChainServiceProtocol? { get set }
    func fetchMovies(category: Category, completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchMovieDetails(id: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void)
}
