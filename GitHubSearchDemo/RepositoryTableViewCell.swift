//
//  RepositoryTableViewCell.swift
//  GitHubSearchDemo
//
//  Created by Kamil Krzyszczak on 22/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import UIKit

final class RepositoryTableViewCell: UITableViewCell {

    private var repositoryForksLabel: UILabel!
    private var repositoryDescriptionLabel: UILabel!
    private var repositoryNameLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViewElements()
        self.setupViewConstraints()
    }

    func fillWithData(repository: Repository) {
        if let name = repository.full_name {
            repositoryNameLabel.text = name
        }
        if let description = repository.description {
            repositoryDescriptionLabel.text = description
        }
        if let forks = repository.forks,
            let watchers = repository.watchers_count,
            let size = repository.size {
            repositoryForksLabel.text = "⑂: \(forks) | 👀: \(watchers) | ⚖️: \(size) KB"
        }
    }

    private func setupViewElements() {
        repositoryNameLabel = setupNameLabel()
        repositoryDescriptionLabel = setupDescriptionLabel()
        repositoryForksLabel = setupForksLabel()
        addSubview(repositoryNameLabel)
        addSubview(repositoryDescriptionLabel)
        addSubview(repositoryForksLabel)
    }

    private func setupNameLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }

    private func setupDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }

    private func setupForksLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }

    private func setupViewConstraints() {
        repositoryForksLabel.anchor(top: topAnchor,
                                    left: leftAnchor,
                                    bottom: nil,
                                    right: rightAnchor,
                                    paddingTop: 5,
                                    paddingLeft: 5,
                                    paddingBottom: 5,
                                    paddingRight: 5,
                                    width: 0,
                                    height: 0,
                                    enableInsets: false)
        repositoryNameLabel.anchor(top: repositoryForksLabel.bottomAnchor,
                                   left: leftAnchor,
                                   bottom: nil,
                                   right: rightAnchor,
                                   paddingTop: 5,
                                   paddingLeft: 5,
                                   paddingBottom: 0,
                                   paddingRight: 5,
                                   width: 0,
                                   height: 0,
                                   enableInsets: false)
        repositoryDescriptionLabel.anchor(top: repositoryNameLabel.bottomAnchor,
                                          left: leftAnchor,
                                          bottom: bottomAnchor,
                                          right: rightAnchor,
                                          paddingTop: 5,
                                          paddingLeft: 5,
                                          paddingBottom: 5,
                                          paddingRight: 5,
                                          width: 0,
                                          height: 0,
                                          enableInsets: false)

    }
}
