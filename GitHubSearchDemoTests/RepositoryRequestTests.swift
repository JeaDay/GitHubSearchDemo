//
//  RepositoryRequestTests.swift
//  GitHubSearchDemoTests
//
//  Created by Kamil Krzyszczak on 22/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import XCTest
@testable import GitHubSearchDemo

final class RepositoryRequestTests: XCTestCase {

    var request: RepositoryRequest!

    override func setUp() {
        super.setUp()
        request = RepositoryRequest(named: "tetris")
    }

    func testName() {
        XCTAssert(request.name == "tetris")
    }

    func testIsGetType() {
        XCTAssert(request.method == .GET)
    }
}
