//
//  APIClient.swift
//  GitHubSearchDemo
//
//  Created by Kamil Krzyszczak on 20/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import RxSwift
import RxCocoa
import RxAlamofire

class APIClient {
    private var baseURL: String!

    init (baseURL: String = APIConstants.baseURL) {
        self.baseURL = baseURL
    }

    func prefetch(repositoryRequest: RepositoryRequest) -> Observable<[Repository]> {
        return Observable<[Repository]>.create { observer in
            guard !repositoryRequest.name.isEmpty else {
                return Disposables.create()
            }
            let repositoryURL = self.baseURL.replacingOccurrences(of: "XxX",
                                                                    with: repositoryRequest.name)
            let task = request(.get, repositoryURL)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .data()
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { (data) in
                    do {
                        let model: Repositories = try JSONDecoder().decode(Repositories.self, from: data)
                        guard let repositories = model.items, !repositories.isEmpty else {
                            observer.onNext([])
                            return
                        }
                        observer.onNext(repositories)
                    } catch let error {
                        observer.onError(error)
                    }
                }, onError: { (error) in
                    print("repositoryURL: \(repositoryURL)\n request error: \(error)")
                    observer.onNext([])
                    observer.onError(error)
                }, onCompleted: {}, onDisposed: {})

            return Disposables.create {
                task.dispose()
            }
        }
    }

}
