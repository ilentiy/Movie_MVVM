// MovieDetailsViewModel.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Вью модель экрана "Подробнее о фильме"
final class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    // MARK: - Public properties

    var movieId: Int?
    var movieDetails: MovieDetail?
    var updateView: VoidHandler?
    var showErrorAlert: ErrorHandler?

    // MARK: - Private Properties

    private var coreDataService: CoreDataServiceProtocol?
    private var networkService: NetworkServiceProtocol?
    private var imageService: ImageServiceProtocol?

    // MARK: - Init

    init(
        networkService: NetworkServiceProtocol,
        imageService: ImageServiceProtocol,
        coreDataService: CoreDataServiceProtocol,
        movieId: Int?
    ) {
        self.networkService = networkService
        self.imageService = imageService
        self.coreDataService = coreDataService
        self.movieId = movieId
    }

    // MARK: - Public methods

    func loadData() {
        coreDataService?.getMovieDetailData(movieId: movieId ?? 0) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(movieDetails):
                self.movieDetails = movieDetails
                self.updateView?()
            case let .failure(error):
                self.showErrorAlert?(error)
            }
        }
        guard
            let movieDetails = movieDetails
        else {
            fetchMovieDetails()
            return
        }
    }

    func loadImageData(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        imageService?.getImage(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                completion(.success(data))
                self.updateView?()
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
                self.coreDataService?.saveMovieDetail(movie: movieDetails)
                self.updateView?()
            case let .failure(error):
                self.showErrorAlert?(error)
            }
        }
    }
}
