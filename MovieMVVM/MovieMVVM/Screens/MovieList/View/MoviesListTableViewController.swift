// MoviesListTableViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран Фильма
final class MoviesListTableViewController: UITableViewController {
    // MARK: - Private Visual Component

    private lazy var popularButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Title.Button.popular, for: .normal)
        button.backgroundColor = .red
        button.tag = 0
        button.addTarget(self, action: #selector(changeCollection), for: .touchUpInside)
        return button
    }()

    private lazy var topButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Title.Button.top, for: .normal)
        button.backgroundColor = .red
        button.tag = 1
        button.addTarget(self, action: #selector(changeCollection), for: .touchUpInside)
        return button
    }()

    private lazy var upcommingButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Title.Button.upcomming, for: .normal)
        button.backgroundColor = .red
        button.tag = 2
        button.addTarget(self, action: #selector(changeCollection), for: .touchUpInside)
        return button
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = NSLayoutConstraint.Axis.horizontal
        view.distribution = UIStackView.Distribution.fillEqually
        view.alignment = UIStackView.Alignment.center
        view.spacing = 15
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

//    private let activityIndicatorView: UIActivityIndicatorView = {
//        let activityViewController = UIActivityIndicatorView()
//        activityViewController.translatesAutoresizingMaskIntoConstraints = false
//        return activityViewController
//    }()

    // MARK: - Private Property

    var movieListViewModel: MovieListViewModelProtocol?
    var onFinishFlow: ((Int) -> Void)?
    var movieListViewStates: MovieListViewStates = .initial {
        didSet {
            DispatchQueue.main.async {
                self.view.setNeedsLayout()
            }
        }
    }

    init(viewModel: MovieListViewModelProtocol) {
        movieListViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        switch movieListViewStates {
        case .initial:
            setupUI()
//            activityIndicatorView.startAnimating()
//            tableView.isHidden = true
        case .success:
//            tableView.isHidden = false
//            activityIndicatorView.isHidden = true
//            activityIndicatorView.stopAnimating()
            tableView.reloadData()
        case let .failure(error):
            showAlert(error: error)
        }
    }

    // MARK: - Private Methods

    private func setupUI() {
        //  showErrorAlert()
        setupListMoviesStates()
        obtainMovieList()
        navigationController?.navigationBar.isTranslucent = false
        title = Title.Screen.movieList
        // view.addSubview(activityIndicatorView)
        view.addSubview(stackView)
        refreshControl = UIRefreshControl()
        stackView.addArrangedSubview(popularButton)
        stackView.addArrangedSubview(topButton)
        stackView.addArrangedSubview(upcommingButton)
        tableView.refreshControl?.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        view.backgroundColor = .systemBackground
        tableView.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        tableView.register(
            MovieTableViewCell.self,
            forCellReuseIdentifier: Identifiers.cell
        )
        //   setConstraintsActivityView()
        setupConstraints()
    }

    private func obtainMovieList() {
        movieListViewModel?.fetchMoviesType(index: 0)
    }

    private func configureUI() {
        view.backgroundColor = .systemBackground
        tableView.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        tableView.register(
            MovieTableViewCell.self,
            forCellReuseIdentifier: Identifiers.cell
        )
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        ])
//        NSLayoutConstraint.activate([
//            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
    }

    private func giveMovieID(index: Int) {
        guard let movieID = movieListViewModel?.movies?[index].id else { return }
        onFinishFlow?(movieID)
    }

    //    private func updateView() {
    //        movieListViewModel?.updateView = {
    //            DispatchQueue.main.async {
    //                self.tableView.reloadData()
    //            }
    //        }
    //    }

    //    private func showErrorAlert() {
    //        movieListViewModel?.showErrorAlert = { [weak self] error in
    //            guard let self = self else { return }
    //            DispatchQueue.main.async {
    //                self.showAlert(error: error)
    //            }
    //        }
    //    }

    private func setupListMoviesStates() {
        movieListViewModel?.movieListViewStates = { [weak self] state in
            self?.movieListViewStates = state
        }
    }

    @objc private func refreshAction() {
        tableView.refreshControl?.beginRefreshing()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        //   movieListViewModel?.updateView?()
        tableView.refreshControl?.endRefreshing()
    }

    @objc private func changeCollection(_ button: UIButton) {
        movieListViewModel?.fetchMoviesType(index: button.tag)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieListViewModel?.movies?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
          cell.layoutIfNeeded()
      }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = movieListViewModel else { return UITableViewCell() }
        let cell = MovieTableViewCell(style: .default, reuseIdentifier: Identifiers.cell)
        cell.configure(index: indexPath.row, movieListViewModel: viewModel)
        cell.alertDelegate = self
        cell.layoutIfNeeded()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        giveMovieID(index: indexPath.row)
    }
}

extension MoviesListTableViewController: AlertDelegateProtocol {
    func showAlert(error: Error) {
        showAlert(
            title: AlertConstants.errorTitle,
            message: error.localizedDescription,
            actionTitle: AlertConstants.actionTitle,
            handler: nil
        )
    }
}
