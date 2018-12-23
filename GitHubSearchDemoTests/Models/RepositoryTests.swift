//
//  RepositoryTests.swift
//  GitHubSearchDemoTests
//
//  Created by Kamil Krzyszczak on 22/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import XCTest
@testable import GitHubSearchDemo

// swiftlint:disable line_length
final class RepositoryTests: XCTestCase {

    var repositoiry: Repository!

    override func setUp() {
        super.setUp()
        repositoiry = JSONLoader().loadRepositories(fileName: "tetris", type: "json")!.items!.first
    }

    func testID() {
        XCTAssert(repositoiry.id == 76954504)
    }

    func testNodeID() {
        XCTAssert(repositoiry.node_id == "MDEwOlJlcG9zaXRvcnk3Njk1NDUwNA==")
    }

    func testName() {
        XCTAssert(repositoiry.name == "react-tetris")
    }

    func testFullName() {
        XCTAssert(repositoiry.full_name == "chvin/react-tetris")
    }

    func testIsPrivate() {
        XCTAssertFalse(repositoiry.isPrivate!)
    }

    func testHaveOwner() {
        XCTAssertNotNil(repositoiry.owner)
    }

    func testHtmlUrl() {
        XCTAssert(repositoiry.html_url == "https://github.com/chvin/react-tetris")
    }

    func testDescription() {
        XCTAssert(repositoiry.description == "Use React, Redux, Immutable to code Tetris. 🎮")
    }

    func testFork() {
        XCTAssertFalse(repositoiry.fork!)
    }

    func testUrl() {
        XCTAssert(repositoiry.url == "https://api.github.com/repos/chvin/react-tetris")
    }

    func testForksUrl() {
        XCTAssert(repositoiry.forks_url == "https://api.github.com/repos/chvin/react-tetris/forks")
    }

    func testKeysUrl() {
        XCTAssert(repositoiry.keys_url == "https://api.github.com/repos/chvin/react-tetris/keys{/key_id}")
    }

    func testCollaboratorsUrl() {
        XCTAssert(repositoiry.collaborators_url == "https://api.github.com/repos/chvin/react-tetris/collaborators{/collaborator}")
    }

    func testTeamsUrl() {
        XCTAssert(repositoiry.teams_url == "https://api.github.com/repos/chvin/react-tetris/teams")
    }

    func testHooksUrl() {
        XCTAssert(repositoiry.hooks_url == "https://api.github.com/repos/chvin/react-tetris/hooks")
    }

    func testIssueEventsUrl() {
        XCTAssert(repositoiry.issue_events_url == "https://api.github.com/repos/chvin/react-tetris/issues/events{/number}")
    }

    func testEventsUrl() {
        XCTAssert(repositoiry.events_url == "https://api.github.com/repos/chvin/react-tetris/events")
    }

    func testAssigneesUrl() {
        XCTAssert(repositoiry.assignees_url == "https://api.github.com/repos/chvin/react-tetris/assignees{/user}")
    }

    func testBranchesUrl() {
        XCTAssert(repositoiry.branches_url == "https://api.github.com/repos/chvin/react-tetris/branches{/branch}")
    }

    func testTagsUrl() {
        XCTAssert(repositoiry.tags_url == "https://api.github.com/repos/chvin/react-tetris/tags")
    }

    func testBlobsUrl() {
        XCTAssert(repositoiry.blobs_url == "https://api.github.com/repos/chvin/react-tetris/git/blobs{/sha}")
    }

    func testGitTagsUrl() {
        XCTAssert(repositoiry.git_tags_url == "https://api.github.com/repos/chvin/react-tetris/git/tags{/sha}")
    }

    func testGitRefsUrl() {
        XCTAssert(repositoiry.git_refs_url == "https://api.github.com/repos/chvin/react-tetris/git/refs{/sha}")
    }

    func testTreesUrl() {
        XCTAssert(repositoiry.trees_url == "https://api.github.com/repos/chvin/react-tetris/git/trees{/sha}")
    }

    func testStatusesUrl() {
        XCTAssert(repositoiry.statuses_url == "https://api.github.com/repos/chvin/react-tetris/statuses/{sha}")
    }

    func testLanguagesUrl() {
        XCTAssert(repositoiry.languages_url == "https://api.github.com/repos/chvin/react-tetris/languages")
    }

    func testStargazersUrl() {
        XCTAssert(repositoiry.stargazers_url == "https://api.github.com/repos/chvin/react-tetris/stargazers")
    }

    func testContributorsUrl() {
        XCTAssert(repositoiry.contributors_url == "https://api.github.com/repos/chvin/react-tetris/contributors")
    }

    func testSubscribersUrl() {
        XCTAssert(repositoiry.subscribers_url == "https://api.github.com/repos/chvin/react-tetris/subscribers")
    }

    func testSubscriptionUrl() {
        XCTAssert(repositoiry.subscription_url == "https://api.github.com/repos/chvin/react-tetris/subscription")
    }

    func testCommitsUrl() {
        XCTAssert(repositoiry.commits_url == "https://api.github.com/repos/chvin/react-tetris/commits{/sha}")
    }

    func testGitCommitsUrl() {
        XCTAssert(repositoiry.git_commits_url == "https://api.github.com/repos/chvin/react-tetris/git/commits{/sha}")
    }

    func testCommentsUrl() {
        XCTAssert(repositoiry.comments_url == "https://api.github.com/repos/chvin/react-tetris/comments{/number}")
    }

    func testIssueCommentUrl() {
        XCTAssert(repositoiry.issue_comment_url == "https://api.github.com/repos/chvin/react-tetris/issues/comments{/number}")
    }

    func testContentsUrl() {
        XCTAssert(repositoiry.contents_url == "https://api.github.com/repos/chvin/react-tetris/contents/{+path}")
    }

    func testCompareUrl() {
        XCTAssert(repositoiry.compare_url == "https://api.github.com/repos/chvin/react-tetris/compare/{base}...{head}")
    }

    func testMergesUrl() {
        XCTAssert(repositoiry.merges_url == "https://api.github.com/repos/chvin/react-tetris/merges")
    }

    func testArchiveUrl() {
        XCTAssert(repositoiry.archive_url == "https://api.github.com/repos/chvin/react-tetris/{archive_format}{/ref}")
    }

    func testDownloadsUrl() {
        XCTAssert(repositoiry.downloads_url == "https://api.github.com/repos/chvin/react-tetris/downloads")
    }

    func testIssuesUrl() {
        XCTAssert(repositoiry.issues_url == "https://api.github.com/repos/chvin/react-tetris/issues{/number}")
    }

    func testPullsUrl() {
        XCTAssert(repositoiry.pulls_url ==  "https://api.github.com/repos/chvin/react-tetris/pulls{/number}")
    }

    func testMilestonesUrl() {
        XCTAssert(repositoiry.milestones_url == "https://api.github.com/repos/chvin/react-tetris/milestones{/number}")
    }

    func testNotificationsUrl() {
        XCTAssert(repositoiry.notifications_url == "https://api.github.com/repos/chvin/react-tetris/notifications{?since,all,participating}")
    }

    func testLabelsUrl() {
        XCTAssert(repositoiry.labels_url == "https://api.github.com/repos/chvin/react-tetris/labels{/name}")
    }

    func testReleasesUrl() {
        XCTAssert(repositoiry.releases_url == "https://api.github.com/repos/chvin/react-tetris/releases{/id}")
    }

    func testDeploymentsUrl() {
        XCTAssert(repositoiry.deployments_url == "https://api.github.com/repos/chvin/react-tetris/deployments")
    }

    func testCreatedAt() {
        XCTAssert(repositoiry.created_at == "2016-12-20T12:26:11Z")
    }

    func testUpdatedAt() {
        XCTAssert(repositoiry.updated_at == "2018-12-22T02:48:02Z")
    }

    func testPushedAt() {
        XCTAssert(repositoiry.pushed_at == "2018-12-07T23:56:18Z")
    }

    func testGitUrl() {
        XCTAssert(repositoiry.git_url == "git://github.com/chvin/react-tetris.git")
    }

    func testSshUrl() {
        XCTAssert(repositoiry.ssh_url == "git@github.com:chvin/react-tetris.git")
    }

    func testCloneUrl() {
        XCTAssert(repositoiry.clone_url == "https://github.com/chvin/react-tetris.git")
    }

    func testSvnUrl() {
        XCTAssert(repositoiry.svn_url == "https://github.com/chvin/react-tetris")
    }

    func testHomepage() {
        XCTAssert(repositoiry.homepage == "https://chvin.github.io/react-tetris/?lan=en")
    }

    func testSize() {
        XCTAssert(repositoiry.size == 3338)
    }

    func testStrangersCount() {
        XCTAssert(repositoiry.stargazers_count == 3911)
    }

    func testWatchersCount() {
        XCTAssert(repositoiry.watchers_count == 3911)
    }

    func testLanguage() {
        XCTAssert(repositoiry.language == "JavaScript")
    }

    func testHasIssues() {
        XCTAssert(repositoiry.has_issues!)
    }

    func testHasProjects() {
        XCTAssert(repositoiry.has_projects!)
    }

    func testHasDownloads() {
        XCTAssert(repositoiry.has_downloads!)
    }

    func testHasWiki() {
        XCTAssert(repositoiry.has_wiki!)
    }

    func testHasPages() {
        XCTAssert(repositoiry.has_pages!)
    }

    func testForksCount() {
        XCTAssert(repositoiry.forks_count == 696)
    }

    func testArchived() {
        XCTAssertFalse(repositoiry.archived!)
    }

    func testOppenIssuesCount() {
        XCTAssert(repositoiry.open_issues_count == 2)
    }

    func testLicense() {
        XCTAssertNil(repositoiry.license)
    }

    func testForks() {
        XCTAssert(repositoiry.forks == 696)
    }

    func testOpenIssues() {
        XCTAssert(repositoiry.open_issues == 2)
    }

    func testWatchers() {
        XCTAssert(repositoiry.watchers == 3911)
    }

    func testDefaultBranch() {
        XCTAssert(repositoiry.default_branch == "master")
    }

    func testScore() {
        XCTAssert(repositoiry.score == 140.48854)
    }
}
