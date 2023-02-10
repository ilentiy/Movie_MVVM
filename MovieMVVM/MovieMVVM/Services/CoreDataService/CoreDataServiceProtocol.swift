// CoreDataServiceProtocol.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Протокол core data сервиса
protocol CoreDataServiceProtocol {
    func saveMoviesData(movies: [Movie], category: String)
    func getMoviesData(category: String, completion: @escaping (Result<[Movie], Error>) -> Void)
    func saveMovieDetail(movie: MovieDetail)
    func getMovieDetailData(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void)
}
