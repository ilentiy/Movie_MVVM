// MovieListViewStates.swift
// Copyright © Ilenty. All rights reserved.

import Foundation

/// Состояния экрана список фильмов
enum MovieListViewStates {
    case initial
    case loading
    case success
    case failure(Error)
}
