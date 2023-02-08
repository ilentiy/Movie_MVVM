// MovieTableViewCell+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension MovieTableViewCell {
    func makePosterImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "heart")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }

    func makeLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        return label
    }

    func makeTitleLabel() -> UILabel {
        let label = makeLabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }

    func makeOverviewLabel() -> UILabel {
        let label = makeLabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        return label
    }

    func makeVoteAverageLabel() -> UILabel {
        let label = makeLabel()
        label.layer.cornerRadius = 15
        label.layer.borderColor = UIColor.yellow.cgColor
        label.font = .systemFont(ofSize: 12, weight: .heavy)
        label.textColor = .label
        label.clipsToBounds = true
        label.backgroundColor = .red
        return label
    }
}
