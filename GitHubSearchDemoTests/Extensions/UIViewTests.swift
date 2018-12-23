//
//  UIViewTests.swift
//  GitHubSearchDemoTests
//
//  Created by Kamil Krzyszczak on 23/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import Foundation
import XCTest
@testable import GitHubSearchDemo

final class UIViewTests: XCTestCase {

    var view: UIView!
    var superView: UIView!

    override func setUp() {
        super.setUp()
        superView = UIView(frame: UIScreen.main.bounds)
        view = UIView(frame: UIScreen.main.bounds)
        superView.addSubview(view)
    }

    func testEnableInsets() {
        view.anchor(top: superView.topAnchor,
                    left: superView.leftAnchor,
                    bottom: superView.bottomAnchor,
                    right: superView.rightAnchor,
                    paddingTop: 0,
                    paddingLeft: 0,
                    paddingBottom: 0,
                    paddingRight: 0,
                    width: 0,
                    height: 0,
                    enableInsets: true)
    }

    func testHeight() {
        view.anchor(top: superView.topAnchor,
                    left: superView.leftAnchor,
                    bottom: superView.bottomAnchor,
                    right: superView.rightAnchor,
                    paddingTop: 0,
                    paddingLeft: 0,
                    paddingBottom: 0,
                    paddingRight: 0,
                    width: 0,
                    height: 100,
                    enableInsets: false)
    }

    func testHeightWidth() {
        view.anchor(top: superView.topAnchor,
                    left: superView.leftAnchor,
                    bottom: superView.bottomAnchor,
                    right: superView.rightAnchor,
                    paddingTop: 0,
                    paddingLeft: 0,
                    paddingBottom: 0,
                    paddingRight: 0,
                    width: 100,
                    height: 0,
                    enableInsets: false)
    }

    func testHeightWidthHeight() {
        view.anchor(top: superView.topAnchor,
                    left: superView.leftAnchor,
                    bottom: superView.bottomAnchor,
                    right: superView.rightAnchor,
                    paddingTop: 0,
                    paddingLeft: 0,
                    paddingBottom: 0,
                    paddingRight: 0,
                    width: 100,
                    height: 100,
                    enableInsets: false)
    }

    func testPaddings() {
        view.anchor(top: superView.topAnchor,
                    left: superView.leftAnchor,
                    bottom: superView.bottomAnchor,
                    right: superView.rightAnchor,
                    paddingTop: 10,
                    paddingLeft: 10,
                    paddingBottom: 10,
                    paddingRight: 10,
                    width: 0,
                    height: 0,
                    enableInsets: false)
    }
}
