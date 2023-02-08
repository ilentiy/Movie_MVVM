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
//        coordinator.onFinishFlow = { [weak self, weak coordinator] in
//            guard let self = self else { return }
//            self.removeDependency(coordinator)
//            self.start()
//        }
        addDependency(coordinator)
        coordinator.start()
    }

//    private func toAuth() {
//        let coordinator = MovieDetailsCoordinator()
//        coordinator.onFinishFlow = { [weak self, weak coordinator] in
//            guard let self = self else { return }
//            self.removeDependency(coordinator)
//            self.start()
//        }
//        addDependency(coordinator)
//        coordinator.start()
//    }
}
