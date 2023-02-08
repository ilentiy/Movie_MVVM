// MovieDetailsViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Презентер экрана "Подробнее о фильме"
final class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    // MARK: - Public properties

    var movieId: Int?
    var movieDetails: MovieDetails?
    var networkService: NetworkServiceProtocol?
    var imageService: ImageServiceProtocol?
    var updateView: VoidHandler?
    var showErrorAlert: ErrorHandler?

    // MARK: - Init

    init(
        networkService: NetworkServiceProtocol,
        imageService: ImageServiceProtocol,
        movieId: Int?
    ) {
        self.networkService = networkService
        self.movieId = movieId
        self.imageService = imageService
    }

    // MARK: - Public methods

    func loadData() {
        fetchMovieDetails()
    }

    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        imageService?.getImage(url: url) { result in
            switch result {
            case let .success(data):
                completion(.success(data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - Private methods

    private func fetchMovieDetails() {
        guard let id = movieId else { return }
        networkService?.fetchMovieDetails(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(movieDetails):
                self.movieDetails = movieDetails
                self.updateView?()
            case let .failure(error):
                self.showErrorAlert?(error)
            }
        }
    }
}
