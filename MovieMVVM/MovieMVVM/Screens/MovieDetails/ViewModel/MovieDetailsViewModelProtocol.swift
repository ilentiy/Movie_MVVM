// MovieDetailsViewModelProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол вью модели экрана "Подробнее о фильме"
protocol MovieDetailsViewModelProtocol {
    // MARK: - Public Properties

    var movieDetails: MovieDetails? { get set }
    var movieId: Int? { get set }
    var imageService: ImageServiceProtocol? { get set }
    var networkService: NetworkServiceProtocol? { get set }
    var updateView: VoidHandler? { get set }
    var showErrorAlert: ErrorHandler? { get set }

    // MARK: - Public Methods

    func loadData()
    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
