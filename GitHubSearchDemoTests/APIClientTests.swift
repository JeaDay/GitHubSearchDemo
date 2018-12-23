//
//  APIClientTests.swift
//  GitHubSearchDemoTests
//
//  Created by Kamil Krzyszczak on 22/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import OHHTTPStubs

@testable import GitHubSearchDemo

// swiftlint:disable line_length
final class APIClientTests: XCTestCase {
    private let testBaseURL = "https://localhost/search/repositories?q=XxX&sort=stars&order=desc"
    var client: APIClient!

    override func setUp() {
        super.setUp()
        client = APIClient(baseURL: testBaseURL)
    }

    func testPrefetch() {
        loadValidStub()
        let expectation = self.expectation(description: "\(#function)")
        var catchedRepositories: [Repository] = []
        let request = RepositoryRequest(named: "tetris")
        _ = client.prefetch(repositoryRequest: request).asObservable()
            .subscribe(
                onNext: { (repositories) in
                    catchedRepositories = repositories
                    expectation.fulfill()
            },
                onError: { (_) in
                    XCTFail("Error was found")
                    expectation.fulfill()
            },
                onCompleted: {},
                onDisposed: {})
        self.waitForExpectations(timeout: 3) { (_) -> Void in
            XCTAssert(!catchedRepositories.isEmpty)
        }
    }

    func testPrefetchGetSameData() {
        loadValidStub()
        let expectation = self.expectation(description: "\(#function)")
        var catchedRepositories: [Repository] = []
        let request = RepositoryRequest(named: "test")
        _ = client.prefetch(repositoryRequest: request).asObservable()
            .subscribe(
                onNext: { (repositories) in
                    catchedRepositories = repositories
                    expectation.fulfill()
            },
                onError: { (_) in
                    XCTFail("Error was found")
                    expectation.fulfill()
            },
                onCompleted: {},
                onDisposed: {})
        self.waitForExpectations(timeout: 3) { (_) -> Void in
            XCTAssert(catchedRepositories.first?.name == "react-tetris")
        }
    }

    func testPrefetchDownOnBorkenConnection() {
        loadNetworkFailedStub()
        let expectation = self.expectation(description: "\(#function)")
        var catchedRepositories: [Repository] = []
        let request = RepositoryRequest(named: "test")
        _ = client.prefetch(repositoryRequest: request).asObservable()
            .subscribe(
                onNext: { (repositories) in
                    catchedRepositories = repositories
            },
                onError: { (_) in
                    expectation.fulfill()
            },
                onCompleted: {},
                onDisposed: {})
        self.waitForExpectations(timeout: 3) { (_) -> Void in
            XCTAssert(catchedRepositories.isEmpty)
        }
    }

    func testPrefetchEmptyList() {
        loadValidEmptyStub()
        let expectation = self.expectation(description: "\(#function)")
        var catchedRepositories: [Repository] = []
        let request = RepositoryRequest(named: "test")
        _ = client.prefetch(repositoryRequest: request).asObservable()
            .subscribe(
                onNext: { (repositories) in
                    catchedRepositories = repositories
                    expectation.fulfill()
            },
                onError: { (_) in
                    XCTFail("Not possible!")
            },
                onCompleted: {},
                onDisposed: {})
        self.waitForExpectations(timeout: 3) { (_) -> Void in
            XCTAssert(catchedRepositories.isEmpty)
        }
    }

    func testPrefetchBrokenJSON() {
        loadNotValidStub()
        let expectation = self.expectation(description: "\(#function)")
        var catchedError: Error!
        let request = RepositoryRequest(named: "test")
        _ = client.prefetch(repositoryRequest: request).asObservable()
            .subscribe(
                onNext: { (_) in
                    XCTFail("Not possible!")
            },
                onError: { (error) in
                    catchedError = error
                    expectation.fulfill()
            },
                onCompleted: {},
                onDisposed: {})
        self.waitForExpectations(timeout: 3) { (_) -> Void in
            XCTAssert(catchedError.localizedDescription == "The data couldn’t be read because it isn’t in the correct format.")
        }
    }

    private func loadValidStub() {
        stub(condition: isHost("localhost")) { _ in
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile("tetris.json", type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type": "application/json"]
            )
        }
    }

    private func loadValidEmptyStub() {
        stub(condition: isHost("localhost")) { _ in
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile("tetrisEmptyList.json", type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type": "application/json"]
            )
        }
    }

    private func loadNotValidStub() {
        stub(condition: isHost("localhost")) { _ in
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile("tetrisNotVaild.json", type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type": "application/json"]
            )
        }
    }

    private func loadNetworkFailedStub() {
        stub(condition: isHost("localhost")) { _ in
            let notConnectedError = NSError(domain: NSURLErrorDomain, code: URLError.notConnectedToInternet.rawValue)
            return OHHTTPStubsResponse(error:notConnectedError)
        }
    }
}
