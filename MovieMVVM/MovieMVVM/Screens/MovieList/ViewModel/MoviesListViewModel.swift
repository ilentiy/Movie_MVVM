// MoviesListViewModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Вью модель экрана списка фильмов
final class MoviesListViewModel: MovieListViewModelProtocol {
    // MARK: - Public Properties

    var movies: [Movie]?
    var imageService: ImageServiceProtocol?
    var networkService: NetworkServiceProtocol?
    var movieListViewStates: ((MovieListViewStates) -> ())?

    // MARK: - Init

    init(
        networkService: NetworkServiceProtocol,
        imageService: ImageServiceProtocol
    ) {
        self.networkService = networkService
        self.imageService = imageService
    }

    // MARK: - Public Methods

    func fetchMoviesType(index: Int) {
        switch index {
        case 0:
            fetchMovies(category: .popular)
        case 1:
            fetchMovies(category: .top)
        case 2:
            fetchMovies(category: .upcoming)
        default:
            fetchMovies(category: .popular)
        }
    }

    func fetchMovieList() {
        fetchMovies(category: .popular)
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

    // MARK: - Private Methods

    private func fetchMovies(category: Category) {
        movieListViewStates?(.loading)
        networkService?.fetchMovies(category: category) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(movies):
                DispatchQueue.main.async {
                    self.movies = movies
                }
                self.movieListViewStates?(.success)
            case let .failure(error):
                self.movieListViewStates?(.failure(error))
            }
        }
    }
}
