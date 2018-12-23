//
//  LicenseTests.swift
//  GitHubSearchDemoTests
//
//  Created by Kamil Krzyszczak on 22/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import XCTest
@testable import GitHubSearchDemo

// swiftlint:disable line_length
final class LicenseTests: XCTestCase {

    var license: License!

    override func setUp() {
        super.setUp()
        license = JSONLoader().loadRepositories(fileName: "tetris", type: "json")!.items!.filter({ (repository) -> Bool in
            repository.license != nil
        }).first?.license
    }

    func testLicense() {
        XCTAssertNotNil(license)
    }

    func testKey() {
        XCTAssert(license.key == "mit")
    }

    func testName() {
        XCTAssert(license.name == "MIT License")
    }

    func testSpdID() {
        XCTAssert(license.spdx_id == "MIT")
    }

    func testURL() {
        XCTAssert(license.url == "https://api.github.com/licenses/mit")
    }

    func testNodeID() {
        XCTAssert(license.node_id == "MDc6TGljZW5zZTEz")
    }
}
