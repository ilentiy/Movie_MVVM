// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Координатор приложения
final class ApplicationCoordinator: BaseCoordinator {
    var assemblyModuleBuilder: AssemblyBuilderProtocol?

    init(assemblyModuleBuilder: AssemblyBuilderProtocol) {
        self.assemblyModuleBuilder = assemblyModuleBuilder
    }

    // MARK: Public Methods

    override func start() {
        guard let assemblyModuleBuilder = assemblyModuleBuilder else { return }
        toMovieList(assemblyModuleBuilder: assemblyModuleBuilder)
    }

    // MARK: Private Methods

    private func toMovieList(assemblyModuleBuilder: AssemblyBuilderProtocol) {
        let coordinator = MovieListCoordinator(assemblyModuleBuilder: assemblyModuleBuilder)
        addDependency(coordinator)
        coordinator.start()
    }
}
