// CoreDataService.swift
// Copyright © Ilenty. All rights reserved.

import CoreData

/// Core Data сервис
final class CoreDataService: CoreDataServiceProtocol {
    // MARK: - Private Enum

    private enum Constants {
        static let movieDataEntity = "MovieData"
        static let movieDetailDataEntity = "MovieDetailData"
        static let genresDataEntity = "GenreData"
        static let categoryPredicate = "category = %@"
        static let idPredicate = "id == %i"
    }

    // MARK: - Private Properties

    private let modelName: String

    private lazy var managedContext: NSManagedObjectContext = self.storeContainer.viewContext
    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // MARK: - Init

    init(modelName: String) {
        self.modelName = modelName
    }

    // MARK: - Public Methods

    func saveMoviesData(movies: [Movie], category: String) {
        guard let newMovie = NSEntityDescription.entity(forEntityName: Constants.movieDataEntity, in: managedContext)
        else { return }
        for movie in movies {
            let movieObject = MovieData(entity: newMovie, insertInto: managedContext)
            movieObject.title = movie.title
            movieObject.originalTitle = movie.originalTitle
            movieObject.posterPath = movie.posterPath
            movieObject.overview = movie.overview
            movieObject.voteAverage = movie.voteAverage
            movieObject.movieId = Int64(movie.movieId)
            movieObject.category = category
            movieObject.id = UUID()

            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    func getMoviesData(category: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        var movieObjects: [MovieData] = []
        var movies: [Movie] = []
        let fetchRequest: NSFetchRequest<MovieData> = MovieData.fetchRequest()
        let predicate = NSPredicate(format: Constants.categoryPredicate, category)
        fetchRequest.predicate = predicate
        do {
            movieObjects = try managedContext.fetch(fetchRequest)
            for movieObject in movieObjects {
                let movie = Movie(
                    movieId: Int(movieObject.movieId),
                    originalTitle: movieObject.originalTitle ?? "",
                    overview: movieObject.overview ?? "",
                    posterPath: movieObject.posterPath ?? "",
                    releaseDate: movieObject.releaseDate ?? "",
                    title: movieObject.title ?? "",
                    voteAverage: movieObject.voteAverage
                )
                movies.append(movie)
            }
            completion(.success(movies))
        } catch let error as NSError {
            completion(.failure(error))
        }
    }

    func saveMovieDetail(movie: MovieDetail) {
        guard
            let movieEntity = NSEntityDescription.entity(
                forEntityName: Constants.movieDetailDataEntity,
                in: managedContext
            ),
            let genresEntity = NSEntityDescription.entity(forEntityName: Constants.genresDataEntity, in: managedContext)
        else { return }
        let movieObject = MovieDetailData(entity: movieEntity, insertInto: managedContext)
        movieObject.backdropPath = movie.backdropPath
        movieObject.budget = Int64(movie.budget)
        movieObject.homepage = movie.homepage
        movieObject.id = Int64(movie.id)
        movieObject.originalLanguage = movie.originalLanguage
        movieObject.originalTitle = movie.originalTitle
        movieObject.overview = movie.overview
        movieObject.popularity = movie.popularity
        movieObject.posterPath = movie.posterPath
        movieObject.releaseDate = movie.releaseDate
        movieObject.revenue = Int64(movie.revenue)
        movieObject.runtime = Int64(movie.runtime)
        movieObject.status = movie.status
        movieObject.tagline = movie.tagline
        movieObject.title = movie.title
        movieObject.voteAverage = movie.voteAverage
        movieObject.voteCount = Int64(movie.voteCount)
        for genre in movie.genres {
            let genreObject = GenreData(entity: genresEntity, insertInto: managedContext)
            genreObject.name = genre.name
            movieObject.addToGenres(genreObject)
        }
        do {
            try managedContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }

    func getMovieDetailData(movieId: Int, completion: @escaping (Result<MovieDetail, Error>) -> Void) {
        var movieDetail: MovieDetail
        var genres: [Genre] = []
        let fetchRequest: NSFetchRequest<MovieDetailData> = MovieDetailData.fetchRequest()
        let predicate = NSPredicate(format: Constants.idPredicate, Int64(movieId))
        fetchRequest.predicate = predicate
        do {
            guard let movieObject = try? managedContext.fetch(fetchRequest).first else { return }
            guard let genresData = movieObject.genres?.allObjects as? [GenreData] else { return }
            for genreData in genresData {
                let genre = Genre(name: genreData.name ?? "")
                genres.append(genre)
            }
            movieDetail = MovieDetail(
                backdropPath: movieObject.backdropPath ?? "",
                budget: Int(movieObject.budget),
                genres: genres,
                homepage: movieObject.homepage ?? "",
                id: Int(movieObject.id),
                originalLanguage: movieObject.originalLanguage ?? "",
                originalTitle: movieObject.originalTitle ?? "",
                overview: movieObject.overview ?? "",
                popularity: movieObject.popularity,
                posterPath: movieObject.posterPath ?? "",
                releaseDate: movieObject.releaseDate ?? "",
                revenue: Int(movieObject.revenue),
                runtime: Int(movieObject.runtime),
                status: movieObject.status ?? "",
                tagline: movieObject.tagline ?? "",
                title: movieObject.title ?? "",
                voteAverage: movieObject.voteAverage,
                voteCount: Int(movieObject.voteCount)
            )
            completion(.success(movieDetail))
        } catch {
            completion(.failure(error))
        }
    }
}
