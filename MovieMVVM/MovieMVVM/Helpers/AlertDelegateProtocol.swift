// AlertDelegateProtocol.swift
// Copyright © Ilentiy. All rights reserved.

import UIKit

/// Протокол делегата
protocol AlertDelegateProtocol: AnyObject {
    func showAlert(error: Error)
}
