//
//  BaseViewController.swift
//  GitHubSearchDemo
//
//  Created by Kamil Krzyszczak on 19/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SafariServices

class BaseViewController: UIViewController {

    private let tableView = UITableView()
    private let cellIdentifier = "RepositoryTableViewCell"
    private let apiClient = APIClient()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupConstraints()
        self.setupRxBinds()
    }

    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search for repository"
        return searchController
    }()

    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        self.definesPresentationContext = true
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        navigationItem.searchController = searchController
        navigationItem.title = "Repository finder"
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupConstraints() {
        view.backgroundColor = UIColor.white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        tableView.contentInset.bottom = view.safeAreaInsets.bottom
        tableView.tableFooterView = UIView()
    }

    private func setupRxBinds() {
        searchController.searchBar.rx.text
            .orEmpty
            .asObservable()
            .throttle(3.0, scheduler: MainScheduler.instance)
            .map { ($0).lowercased() }
            .map { RepositoryRequest(named: $0) }
            .flatMap { request -> Observable<[Repository]> in
                return self.apiClient.prefetch(repositoryRequest: request)
            }
            .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier)) { _, model, cell in
                guard let repositoryCell = cell as? RepositoryTableViewCell else {
                    print("Failed to cast cell into RepositoryTableViewCell")
                    return
                }
                repositoryCell.fillWithData(repository: model)
            }
            .disposed(by: disposeBag)

        tableView.rx.modelSelected(Repository.self)
            .map { URL(string: $0.html_url ?? "")! }
            .map { SFSafariViewController(url: $0) }
            .subscribe(onNext: { [weak self] safariViewController in
                self?.present(safariViewController, animated: true)
            })
            .disposed(by: disposeBag)
    }
}
