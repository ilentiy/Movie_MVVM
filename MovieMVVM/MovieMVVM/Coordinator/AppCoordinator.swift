// AppCoordinator.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Координатор приложения
final class ApplicationCoordinator: BaseCoordinator {
    // MARK: - Private Properties

    private var assemblyModuleBuilder: AssemblyBuilderProtocol?

    // MARK: - Init

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
        let coordinator = MovieCoordinator(assemblyModuleBuilder: assemblyModuleBuilder)
        addDependency(coordinator)
        coordinator.start()
    }
}
