// HeaderImageTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с постером
class HeaderImageTableViewCell: UITableViewCell {
    // MARK: - Pivate Visual Component

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 0.75
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()

    private let backdropImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(movieDetailsViewModel: MovieDetailsViewModelProtocol) {
        setupPosterImage(movieDetailsViewModel: movieDetailsViewModel)
        setupBackdropImage(movieDetailsViewModel: movieDetailsViewModel)
    }

    // MARK: - Private Methods

    private func setupPosterImage(movieDetailsViewModel: MovieDetailsViewModelProtocol) {
        guard let url = movieDetailsViewModel.movieDetails?.posterPath else { return }
        movieDetailsViewModel.loadImageData(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.posterImageView.image = UIImage(data: data)
            case let .failure(error):
                self.alertDelegate?.showAlert(error: error)
            }
        }
    }

    private func setupBackdropImage(movieDetailsViewModel: MovieDetailsViewModelProtocol) {
        guard let url = movieDetailsViewModel.movieDetails?.backdropPath else { return }
        movieDetailsViewModel.loadImageData(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(data):
                self.backdropImageView.image = UIImage(data: data)
            case let .failure(error):
                self.alertDelegate?.showAlert(error: error)
            }
        }
    }

    private func setupUI() {
        addSubview(backdropImageView)
        addSubview(posterImageView)
        backdropImageViewConstraints()
        posterImageViewConstraints()
    }

    private func backdropImageViewConstraints() {
        NSLayoutConstraint.activate([
            backdropImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backdropImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backdropImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backdropImageView.widthAnchor.constraint(equalTo: widthAnchor),
            backdropImageView.heightAnchor.constraint(equalTo: backdropImageView.widthAnchor, multiplier: 0.56),
        ])
    }

    private func posterImageViewConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: backdropImageView.leadingAnchor, constant: 25),
            posterImageView.centerYAnchor.constraint(equalTo: backdropImageView.centerYAnchor),
            posterImageView.heightAnchor.constraint(equalTo: backdropImageView.heightAnchor, multiplier: 0.75),
            posterImageView.widthAnchor.constraint(equalTo: posterImageView.heightAnchor, multiplier: 0.66),
        ])
    }
}
