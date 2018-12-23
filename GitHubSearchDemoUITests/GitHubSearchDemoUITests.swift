//
//  GitHubSearchDemoUITests.swift
//  GitHubSearchDemoUITests
//
//  Created by Kamil Krzyszczak on 23/12/2018.
//  Copyright © 2018 JeaCode. All rights reserved.
//

import XCTest

// swiftlint:disable line_length
class GitHubSearchDemoUITests: XCTestCase {

    //TODO This should be maked with WireMock

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testFullCycle() {
        let app = XCUIApplication()
        app.searchFields["Search for repository"].tap()
        app.searchFields["Search for repository"].typeText("Tetris")
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"Szukaj\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.otherElements["PopoverDismissRegion"]/*[[".otherElements[\"dismiss popup\"]",".otherElements[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(3)
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["chvin/react-tetris"]/*[[".cells.staticTexts[\"chvin\/react-tetris\"]",".staticTexts[\"chvin\/react-tetris\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.otherElements["URL"]/*[[".buttons[\"Address\"]",".otherElements[\"Address\"]",".otherElements[\"URL\"]",".buttons[\"URL\"]"],[[[-1,2],[-1,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

}
