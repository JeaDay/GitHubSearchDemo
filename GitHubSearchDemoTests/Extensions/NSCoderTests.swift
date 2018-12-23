//
//  NSCoderTests.swift
//  GitHubSearchDemoTests
//
//  Created by Kamil Krzyszczak on 23/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import Foundation
import XCTest
@testable import GitHubSearchDemo

final class NSCoderTests: XCTestCase {

    func testCoder() {
        XCTAssertNotNil(NSCoder.empty())
    }
}
