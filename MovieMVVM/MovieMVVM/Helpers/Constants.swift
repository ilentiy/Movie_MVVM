// Constants.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Базовые ссылки
enum BaseURL {
    static let movies = "https://api.themoviedb.org/3/movie/"
    static let image = "https://image.tmdb.org/t/p/w500"
    static let apiKey = "?api_key=5e95e9b030369d612dfb2d6ecdfb4cf2&language=ru-RU"
}

/// Identifiers
enum Identifiers {
    static let headerImage = "HeaderImage"
    static let mainInfo = "MainInfo"
    static let credits = "Credits"
    static let credit = "Credits"
    static let cell = "Movie"
}

/// Тайтлы
enum Title {
    enum Button {
        static let popular = "Популярное"
        static let top = "В топе"
        static let upcomming = "Скоро"
    }

    enum Screen {
        static let movieList = "Список Фильмов"
    }
}

/// Константы для алерта
enum AlertConstants {
    static let errorTitle = "Ошибка"
    static let errorMessageText = "Ошибка парсинга"
    static let actionTitle = "Ok"
    static let emptyString = ""
}

/// Констатнты
enum Constants {
    static let keyText = "isLogin"
    static let login = "admin"
    static let password = "admin"
    static let passwordText = "Пароль"
    static let okText = "OK"
    static let storyboardName = "Main"
    static let loginViewController = "LoginViewController"
    static let recoveryViewController = "RecoveryViewController"
    static let mainViewController = "MainViewController"
    static let fatalError = "init(coder:) has not been implemented"
    static let runtimeFormat = "%d ч. %d мин."
    static let emptyString = ""
    static let spaceSeparator = " "
    static let minusSeparator: String = "-"
    static let description = "Описание\n"
    static let newLine = "\n"
    static let voteFormat = "%.1f"
    static let divider = 60
}

/// Псевдоним Типа
typealias VoidHandler = () -> ()
typealias ErrorHandler = (Error) -> ()
typealias IntHandler = (Int) -> ()
