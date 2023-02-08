// MovieDetailsViewModelProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол презентера экрана "Подробнее о фильме"
protocol MovieDetailsViewModelProtocol {
    var movieDetails: MovieDetails? { get set }
    var movieId: Int? { get set }
    var imageService: ImageServiceProtocol? { get set }
    var networkService: NetworkServiceProtocol? { get set }
    var updateView: VoidHandler? { get set }
    var showErrorAlert: ErrorHandler? { get set }

    func loadData()
    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
