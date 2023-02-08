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

    private let activityIndicatorView: UIActivityIndicatorView = {
        let activityViewController = UIActivityIndicatorView()
        activityViewController.translatesAutoresizingMaskIntoConstraints = false
        return activityViewController
    }()

    // MARK: - Public Properties

    var onFinishFlow: IntHandler?
    var movieListViewStates: MovieListViewStates = .initial {
        didSet {
            DispatchQueue.main.async {
                self.changeState()
            }
        }
    }

    // MARK: - Private Properties

    private var movieListViewModel: MovieListViewModelProtocol?

    // MARK: - Init

    init(viewModel: MovieListViewModelProtocol) {
        movieListViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupListMoviesStates()
        movieListViewStates = .initial
    }

    // MARK: - Private Methods

    private func setupUI() {
        navigationController?.navigationBar.isTranslucent = false
        title = Title.Screen.movieList
        view.addSubview(stackView)
        setConstraintsStackView()
        view.addSubview(activityIndicatorView)
        setConstraintsTableView()
        setConstraintsActivityView()
        refreshControl = UIRefreshControl()
        stackView.addArrangedSubview(popularButton)
        stackView.addArrangedSubview(topButton)
        stackView.addArrangedSubview(upcommingButton)
        tableView.refreshControl?.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        tableView.contentInset = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        tableView.register(
            MovieTableViewCell.self,
            forCellReuseIdentifier: Identifiers.cell
        )
    }

    private func changeState() {
        switch movieListViewStates {
        case .initial:
            setupUI()
            fetchMoviesList()
        case .loading:
            activityIndicatorView.startAnimating()
            activityIndicatorView.isHidden = false
        case .success:
            activityIndicatorView.stopAnimating()
            activityIndicatorView.isHidden = true
            tableView.reloadData()
        case let .failure(error):
            activityIndicatorView.stopAnimating()
            activityIndicatorView.isHidden = true
            showAlert(error: error)
        }
    }

    private func setupListMoviesStates() {
        movieListViewModel?.movieListViewStates = { [weak self] state in
            self?.movieListViewStates = state
        }
    }

    private func fetchMoviesList() {
        movieListViewModel?.fetchMovieList()
    }

    private func setConstraintsActivityView() {
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setConstraintsStackView() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func setConstraintsTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func giveMovieID(index: Int) {
        guard let movieID = movieListViewModel?.movies?[index].id else { return }
        onFinishFlow?(movieID)
    }

    @objc private func refreshAction() {
        tableView.refreshControl?.beginRefreshing()
        movieListViewStates = .success
        tableView.refreshControl?.endRefreshing()
    }

    @objc private func changeCollection(_ button: UIButton) {
        movieListViewModel?.fetchMoviesType(index: button.tag)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieListViewModel?.movies?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = movieListViewModel else { return UITableViewCell() }
        let cell = MovieTableViewCell(style: .default, reuseIdentifier: Identifiers.cell)
        cell.configure(index: indexPath.row, movieListViewModel: viewModel)
        cell.alertDelegate = self
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        giveMovieID(index: indexPath.row)
    }
}

/// AlertDelegateProtocol
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
