// UIViewController+Extension.swift
// Copyright © Ilentiy. All rights reserved.

import UIKit

/// Алерт для контролера
extension UIViewController {
    // MARK: - Public Methods

    func showAlert(
        title: String?,
        message: String?,
        actionTitle: String?,
        handler: ((UIAlertAction) -> ())?
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let alertControllerAction = UIAlertAction(
            title: actionTitle,
            style: .default,
            handler: handler
        )
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }

    func showAPIKeyAlert(
        title: String?,
        message: String,
        handler: Closure
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertControllerAction = UIAlertAction(title: AlertConstants.actionTitle, style: .default) { _ in
            let result = alertController.textFields?.first?.text ?? ""
            handler?(result)
        }
        alertController.addTextField()
        alertController.addAction(alertControllerAction)
        present(alertController, animated: true)
    }
}
