// AssemblyBuilderProtocol.swift
// Copyright © Ilenty. All rights reserved.

import UIKit

/// Протокол билдера
protocol AssemblyBuilderProtocol {
    func makeMoviesTableView() -> UIViewController
    func makeMovieDetailsTableView(movieId: Int?) -> UIViewController
}
