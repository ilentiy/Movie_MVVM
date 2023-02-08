// MovieListCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор главного экрана
final class MovieListCoordinator: BaseCoordinator {
    // MARK: - Private Visual Component

    private var rootController: UINavigationController?

    // MARK: - Public Propeties

    var onFinishFlow: VoidHandler?
    var assemblyModuleBuilder: AssemblyBuilderProtocol?

    init(assemblyModuleBuilder: AssemblyBuilderProtocol) {
        self.assemblyModuleBuilder = assemblyModuleBuilder
    }

    // MARK: - Public Methods

    override func start() {
        showMovieListModule()
    }

    // MARK: - Private Methods

    private func showMovieListModule() {
        guard let controller = assemblyModuleBuilder?.makeMoviesTableView() as? MoviesListTableViewController
        else { return }
        controller.onFinishFlow = { [weak self] id in
            self?.showMovieDetails(id)
        }
        let rootController = UINavigationController(rootViewController: controller)
        setAsRoot(rootController)
        self.rootController = rootController
    }

    private func showMovieDetails(_ id: Int) {
        guard
            let controller = assemblyModuleBuilder?
            .makeMovieDetailsTableView(movieId: id) as? MovieDetailsTableViewController
        else { return }
        rootController?.pushViewController(controller, animated: true)
    }
}
