//
//  RepositoryTableViewCellTests.swift
//  GitHubSearchDemoTests
//
//  Created by Kamil Krzyszczak on 23/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import Foundation
import XCTest
@testable import GitHubSearchDemo

final class RepositoryTableViewCellTests: XCTestCase {

    var cell: RepositoryTableViewCell!

    override func setUp() {
        cell = RepositoryTableViewCell(style: .default,
                                       reuseIdentifier: "identifier")
    }

    func testCoderInit() {
        cell = RepositoryTableViewCell(coder: NSCoder.empty())
    }

    func testFillWithData() {
        cell.fillWithData(repository: getRepository())
    }

    private func getRepository() -> Repository {
        return JSONLoader().loadRepositories(fileName: "tetris", type: "json")!.items!.first!
    }
}
