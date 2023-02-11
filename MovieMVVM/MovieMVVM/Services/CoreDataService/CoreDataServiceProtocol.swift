// CoreDataServiceProtocol.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Протокол сервиса по сохранению данных в Core Data
protocol CoreDataServiceProtocol {
    func saveMoviesData(movies: [Movie], category: String)
    func getMoviesData(category: String, completion: @escaping (Result<[Movie], Error>) -> Void)
    func saveMovieDetail(movie: MovieDetail)
    func getMovieDetailData(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void)
}
