// SceneDelegate.swift
// Copyright © Ilenty. All rights reserved.

import UIKit

/// SceneDelegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coordinator: ApplicationCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let assemblyModuleBuilder = AssemblyModuleBuilder()
        coordinator = ApplicationCoordinator(assemblyModuleBuilder: assemblyModuleBuilder)
        coordinator?.start()
    }
}
