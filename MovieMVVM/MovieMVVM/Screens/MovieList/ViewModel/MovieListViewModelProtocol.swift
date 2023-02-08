// MovieListViewModelProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол вьюмодели  списка фильмов
protocol MovieListViewModelProtocol {
    // MARK: - Public Properties

    var movies: [Movie]? { get set }
    var imageService: ImageServiceProtocol? { get set }
    var networkService: NetworkServiceProtocol? { get set }
    var movieListViewStates: ((MovieListViewStates) -> ())? { get set }

    // MARK: - Public Methods

    func fetchMoviesType(index: Int)
    func fetchMovieList()
    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
