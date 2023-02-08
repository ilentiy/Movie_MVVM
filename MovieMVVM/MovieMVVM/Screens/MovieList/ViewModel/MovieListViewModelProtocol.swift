// MovieListViewModelProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол вьюмодели  экрана  списка фильмов
protocol MovieListViewModelProtocol {
    var movies: [Movie]? { get set }
    var movieListViewStates: ((MovieListViewStates) -> ())? { get set }

    func fetchMoviesType(index: Int)
    func fetchMovieList()
    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
