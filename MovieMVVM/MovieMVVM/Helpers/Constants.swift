// Constants.swift
// Copyright © Ilentiy. All rights reserved.

import Foundation

/// Базовые ссылки
enum BaseURL {
    static let movies = "https://api.themoviedb.org/3/movie/"
    static let image = "https://image.tmdb.org/t/p/w500"
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
    static let tokenTitle = "Запрос токена"
    static let tokenMessage = "Введите токен"
}

/// Констатнты
enum Constants {
    static let keyText = "token"
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
    static let dataModel = "DataModel"
}

/// Псевдоним Типа
typealias VoidHandler = () -> Void
typealias ErrorHandler = (Error) -> Void
typealias IntHandler = (Int) -> Void
typealias Closure = ((String) -> Void)?
