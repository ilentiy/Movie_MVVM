// MovieTableViewCell.swift
// Copyright © Ilenty. All rights reserved.

import UIKit

///  Прототип ячейки типа списка фильма
final class MovieTableViewCell: UITableViewCell {
    // MARK: - Private Visual Component

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 15
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 13)
        return label
    }()

    private let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 15
        label.layer.borderColor = UIColor.yellow.cgColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .heavy)
        label.textColor = .label
        label.clipsToBounds = true
        label.backgroundColor = .red
        return label
    }()

    // MARK: - Public Properties

    weak var alertDelegate: AlertDelegateProtocol?

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }

    // MARK: - Public Methods

    func configure(index: Int, movieListViewModel: MovieListViewModelProtocol) {
        guard let movie = movieListViewModel.movies?[index] else { return }
        setupPosterImage(url: movie.posterPath, movieListViewModel: movieListViewModel)
        titleLabel.text = "\(movie.title)"
        overviewLabel.text = movie.overview
        switch movie.voteAverage {
        case 0 ..< 5:
            voteAverageLabel.backgroundColor = .red
        case 5 ..< 7:
            voteAverageLabel.backgroundColor = .orange
        case 7 ... 10:
            voteAverageLabel.backgroundColor = .systemGreen
        default:
            voteAverageLabel.backgroundColor = .clear
        }
        voteAverageLabel.text = String(format: Constants.voteFormat, movie.voteAverage)
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(posterImageView)
        addSubview(overviewLabel)
        addSubview(titleLabel)
        addSubview(voteAverageLabel)
        posterImageViewConstraints()
        overviewLabelConstraints()
        titleLabelConstraints()
        voteAverageLabelConstraints()
    }

    private func setupPosterImage(url: String, movieListViewModel: MovieListViewModelProtocol) {
        movieListViewModel.loadImageData(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.posterImageView.image = UIImage(data: data)
            case let .failure(error):
                self.alertDelegate?.showAlert(error: error)
            }
        }
    }

    private func posterImageViewConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            posterImageView.heightAnchor.constraint(equalToConstant: 200),
            posterImageView.widthAnchor.constraint(equalToConstant: 150),
        ])
    }

    private func titleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 35),
        ])
    }

    private func voteAverageLabelConstraints() {
        NSLayoutConstraint.activate([
            voteAverageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            voteAverageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            voteAverageLabel.widthAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 0.2),
            voteAverageLabel.heightAnchor.constraint(equalTo: voteAverageLabel.widthAnchor),
        ])
    }

    private func overviewLabelConstraints() {
        NSLayoutConstraint.activate([
            overviewLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 10),
            overviewLabel.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor, constant: 5),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            overviewLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
