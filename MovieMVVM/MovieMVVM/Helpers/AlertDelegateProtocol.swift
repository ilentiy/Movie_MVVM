// AlertDelegateProtocol.swift
// Copyright © Ilenty. All rights reserved.

import UIKit

/// Протокол делегата
protocol AlertDelegateProtocol: AnyObject {
    func showAlert(error: Error)
}
