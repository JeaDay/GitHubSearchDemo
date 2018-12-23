//
//  OwnerTests.swift
//  GitHubSearchDemoTests
//
//  Created by Kamil Krzyszczak on 22/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import XCTest
@testable import GitHubSearchDemo

final class OwnerTests: XCTestCase {

    var owner: Owner!

    override func setUp() {
        super.setUp()
        owner = JSONLoader().loadRepositories(fileName: "tetris", type: "json")!.items!.first?.owner
    }

    func testOwner() {
        XCTAssertNotNil(owner)
    }

    func testLogin() {
        XCTAssert(owner.login == "chvin")
    }

    func testID() {
        XCTAssert(owner.id == 5383506)
    }

    func testNodeID() {
        XCTAssert(owner.node_id == "MDQ6VXNlcjUzODM1MDY=")
    }

    func testAvatarURL() {
        XCTAssert(owner.avatar_url == "https://avatars2.githubusercontent.com/u/5383506?v=4")
    }

    func testGravatarID() {
        XCTAssert(owner.gravatar_id == "")
    }

    func testURL() {
        XCTAssert(owner.url == "https://api.github.com/users/chvin")
    }

    func testHTMLURL() {
        XCTAssert(owner.html_url == "https://github.com/chvin")
    }

    func testFollowersURL() {
        XCTAssert(owner.followers_url == "https://api.github.com/users/chvin/followers")
    }

    func testFollowingURL() {
        XCTAssert(owner.following_url == "https://api.github.com/users/chvin/following{/other_user}")
    }

    func testGistrsURL() {
        XCTAssert(owner.gists_url == "https://api.github.com/users/chvin/gists{/gist_id}")
    }

    func testStartedURL() {
        XCTAssert(owner.starred_url == "https://api.github.com/users/chvin/starred{/owner}{/repo}")
    }

    func testSubscriptionsUrl() {
        XCTAssert(owner.subscriptions_url == "https://api.github.com/users/chvin/subscriptions")
    }

    func testOrganizationsUrl() {
        XCTAssert(owner.organizations_url == "https://api.github.com/users/chvin/orgs")
    }

    func testReposUrl() {
        XCTAssert(owner.repos_url == "https://api.github.com/users/chvin/repos")
    }

    func testEventsUrl() {
        XCTAssert(owner.events_url == "https://api.github.com/users/chvin/events{/privacy}")
    }

    func testReceivedEventsUrl() {
        XCTAssert(owner.received_events_url == "https://api.github.com/users/chvin/received_events")
    }

    func testType() {
        XCTAssert(owner.type == "User")
    }

    func testSiteAdmin() {
        XCTAssertFalse(owner.site_admin!)
    }
}
