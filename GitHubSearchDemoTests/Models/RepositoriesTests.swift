//
//  RepositoriesTests.swift
//  GitHubSearchDemoTests
//
//  Created by Kamil Krzyszczak on 22/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import XCTest
@testable import GitHubSearchDemo

final class RepositoriesTests: XCTestCase {

    var repositoires: Repositories!

    override func setUp() {
        super.setUp()
        repositoires = JSONLoader().loadRepositories(fileName: "tetris", type: "json")
    }

    func testIsDataLoaded() {
        XCTAssertNotNil(repositoires)
    }

    func testTotalCount() {
        XCTAssert(repositoires.total_count == 21458)
    }

    func testIncompliteResoults() {
        XCTAssertFalse(repositoires.incomplete_results!)
    }

    func testItemsCount() {
        XCTAssert(repositoires.items?.count == 30)
    }
}
