// AlertDelegateProtocol.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол делегата
protocol AlertDelegateProtocol: AnyObject {
    // MARK: - Public Methods

    func showAlert(error: Error)
}
