// MovieListViewModelProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol MovieListViewModelProtocol {
    var movies: [Movie]? { get set }
    var imageService: ImageServiceProtocol? { get set }
    var networkService: NetworkServiceProtocol? { get set }
    var movieListViewStates: ((MovieListViewStates) -> ())? { get set }

    func fetchMoviesType(index: Int)
    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
