// MoviesListViewModel.swift
// Copyright © Ilentiy. All rights reserved.

// import CoreData
import Foundation
// import UIKit

/// Вью модель экрана списка фильмов
final class MoviesListViewModel: MovieListViewModelProtocol {
    // MARK: - Public Properties

    var movies: [Movie]? = []
    var movieListViewStates: ((MovieListViewStates) -> ())?

    // MARK: - Private Properties

    private var imageService: ImageServiceProtocol?
    private var networkService: NetworkServiceProtocol?
    private var keychainService: KeyChainServiceProtocol?
    private var coreDataService: CoreDataServiceProtocol?

    // MARK: - Init

    init(
        networkService: NetworkServiceProtocol,
        imageService: ImageServiceProtocol,
        keychainService: KeyChainServiceProtocol,
        coreDataService: CoreDataServiceProtocol
    ) {
        self.networkService = networkService
        self.imageService = imageService
        self.keychainService = keychainService
        self.coreDataService = coreDataService
    }

    // MARK: - Public Methods

    func fetchMoviesType(index: Int) {
        switch index {
        case 0:
            loadMovies(category: .popular)
        case 1:
            loadMovies(category: .top)
        case 2:
            loadMovies(category: .upcoming)
        default:
            loadMovies(category: .popular)
        }
    }

    private func loadMovies(category: Category) {
        movieListViewStates?(.loading)
        coreDataService?.getMoviesData(category: category.category) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(movies):
                self.movies = movies
                self.movieListViewStates?(.success)
            case let .failure(error):
                self.movieListViewStates?(.failure(error))
            }
        }
        guard let movies = movies else { return }
        if !movies.isEmpty {
            self.movies = movies
        } else {
            fetchMovies(category: category)
        }
        movieListViewStates?(.success)
    }

    func keychainInfo() -> KeyChainServiceProtocol? {
        keychainService
    }

    func fetchMovieList() {
        loadMovies(category: .popular)
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
        networkService?.fetchMovies(category: category) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(movies):
                self.movies = movies
                self.coreDataService?.saveMoviesData(movies: movies, category: category.category)
                self.movieListViewStates?(.success)
            case let .failure(error):
                self.movieListViewStates?(.failure(error))
            }
        }
    }
}
