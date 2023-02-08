// MovieDetailsTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран Фильма
final class MovieDetailsTableViewController: UITableViewController {
    // MARK: - Constants

    private enum TableCellTypes {
        case header
        case description
    }

    // MARK: - Private Properties

    private let tableCellTypes: [TableCellTypes] = [.header, .description]

    // MARK: - Public Properties

    var movieDetailsViewModel: MovieDetailsViewModelProtocol?

    // MARK: - Init

    init(viewModel: MovieDetailsViewModelProtocol) {
        movieDetailsViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        updateView()
        showErrorAlert()
        movieDetailsViewModel?.loadData()
        tableView.allowsSelection = false
        refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    }

    private func updateView() {
        movieDetailsViewModel?.updateView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .label
        tableView.register(
            HeaderImageTableViewCell.self,
            forCellReuseIdentifier: Identifiers.headerImage
        )
        tableView.register(
            MainInfoTableViewCell.self,
            forCellReuseIdentifier: Identifiers.mainInfo
        )
    }

    private func showErrorAlert() {
        movieDetailsViewModel?.showErrorAlert = { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showAlert(error: error)
            }
        }
    }

    @objc private func refreshAction() {
        tableView.refreshControl?.beginRefreshing()
        movieDetailsViewModel?.updateView?()
        tableView.refreshControl?.endRefreshing()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        tableCellTypes.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = movieDetailsViewModel else { return UITableViewCell() }
        let type = tableCellTypes[indexPath.section]
        switch type {
        case .header:
            let cell = HeaderImageTableViewCell(style: .default, reuseIdentifier: Identifiers.headerImage)
            cell.configure(movieDetailsViewModel: viewModel)
            cell.alertDelegate = self
            return cell
        case .description:
            let cell = MainInfoTableViewCell(style: .default, reuseIdentifier: Identifiers.mainInfo)
            cell.configure(movieDetailsViewModel: viewModel)
            return cell
        }
    }
}

extension MovieDetailsTableViewController: AlertDelegateProtocol {
    func showAlert(error: Error) {
        showAlert(
            title: AlertConstants.errorTitle,
            message: error.localizedDescription,
            actionTitle: AlertConstants.actionTitle,
            handler: nil
        )
    }
}
