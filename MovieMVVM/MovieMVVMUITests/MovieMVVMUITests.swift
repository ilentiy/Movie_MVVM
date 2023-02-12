// MovieMVVMUITests.swift
// Copyright © Ilentiy. All rights reserved.

import XCTest

final class MovieMVVMUITests: XCTestCase {
    // MARK: - Private Enum

    enum Constant {
        static let navBar = "Список Фильмов"
        static let nightName = "Моя пиратская свадьба"
        static let listName = "Список Шиндлера"
        static let avatarName = "Аватар: Путь воды"
        static let top = "В топе"
        static let pop = "Популярное"
    }

    // MARK: - Public Methods

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        let movieButton = app.navigationBars[Constant.navBar].buttons[Constant.navBar]
        let tablesQuery = app.tables
        tablesQuery.staticTexts[Constant.nightName].tap()
        sleep(2)
        movieButton.tap()
        app.buttons[Constant.top].tap()
        let staticText = tablesQuery.staticTexts[Constant.listName]
        staticText.tap()
        sleep(3)
        movieButton.tap()
        app.staticTexts[Constant.pop].tap()
        tablesQuery.staticTexts[Constant.avatarName].tap()
        sleep(1)
        movieButton.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
