// MovieDetailsViewModelProtocol.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Протокол вью модели экрана "Подробнее о фильме"
protocol MovieDetailsViewModelProtocol {
    var movieId: Int? { get }
    var updateView: VoidHandler? { get set }
    var movieDetails: MovieDetail? { get }
    var showErrorAlert: ErrorHandler? { get set }

    func loadData()
    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void)
}
