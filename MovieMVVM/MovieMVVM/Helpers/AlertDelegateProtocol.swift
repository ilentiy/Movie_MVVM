// AlertDelegateProtocol.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол делегата
protocol AlertDelegateProtocol: AnyObject {
    func showAlert(error: Error)
}
