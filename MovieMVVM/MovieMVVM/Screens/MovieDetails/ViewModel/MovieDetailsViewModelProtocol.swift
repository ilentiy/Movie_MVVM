// MovieDetailsViewModelProtocol.swift
// Copyright © Ilenty. All rights reserved.

import Foundation

/// Протокол вью модели экрана "Подробнее о фильме"
protocol MovieDetailsViewModelProtocol {
    var movieId: Int? { get set }
    var updateView: VoidHandler? { get set }
    var movieDetails: MovieDetail? { get set }
    var showErrorAlert: ErrorHandler? { get set }

    func loadData()
    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
