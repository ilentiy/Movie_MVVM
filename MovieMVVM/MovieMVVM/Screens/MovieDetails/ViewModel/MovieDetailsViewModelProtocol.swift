// MovieDetailsViewModelProtocol.swift
// Copyright © Ilenty. All rights reserved.

import Foundation

/// Протокол вью модели экрана "Подробнее о фильме"
protocol MovieDetailsViewModelProtocol {
    // MARK: - Public Properties

    var movieDetails: MovieDetail? { get set }
    var movieId: Int? { get set }
    var updateView: VoidHandler? { get set }
    var showErrorAlert: ErrorHandler? { get set }

    // MARK: - Public Methods

    func loadData()
    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
