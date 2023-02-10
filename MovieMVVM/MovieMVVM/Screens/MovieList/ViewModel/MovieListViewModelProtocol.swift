// MovieListViewModelProtocol.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Протокол вьюмодели  экрана  списка фильмов
protocol MovieListViewModelProtocol {
    var movies: [Movie]? { get set }
    var movieListViewStates: ((MovieListViewStates) -> ())? { get set }

    func fetchMovieList()
    func fetchMoviesType(index: Int)
    func keychainInfo() -> KeyChainServiceProtocol?
    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
