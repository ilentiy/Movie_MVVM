// AssemblyModuleBuilder.swift
// Copyright © Ilenty. All rights reserved.

import UIKit

/// Билдер
final class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    // MARK: - Public Methods

    func makeMoviesTableView() -> UIViewController {
        let keychainService = KeyChainService()
        let networkService = NetworkService(keychainService: keychainService)
        let imageService = ImageService()
        let coreDataService = CoreDataService(modelName: "DataModel")
        let movieListViewModel = MoviesListViewModel(
            networkService: networkService,
            imageService: imageService,
            keychainService: keychainService,
            coreDataService: coreDataService
        )
        let movieListViewController = MoviesListTableViewController(viewModel: movieListViewModel)
        return movieListViewController
    }

    func makeMovieDetailsTableView(movieId: Int?) -> UIViewController {
        let keychainService = KeyChainService()
        let networkService = NetworkService(keychainService: keychainService)
        let imageService = ImageService()
        let coreDataService = CoreDataService(modelName: "DataModel")
        let movieDetailViewModel = MovieDetailsViewModel(
            networkService: networkService,
            imageService: imageService,
            coreDataService: coreDataService,
            movieId: movieId
        )
        let movieDetailsViewController = MovieDetailsTableViewController(viewModel: movieDetailViewModel)
        return movieDetailsViewController
    }
}
