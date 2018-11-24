//
//  AppVersionLabelTests.swift
//  AppVersionTests
//
//  Created by Alex on 11/24/18.
//  Copyright © 2018 co.ameba. All rights reserved.
//

import XCTest
@testable import AppVersion

class AppVersionLabelTests: XCTestCase {
    let testResults: [VersionFormat: String]  = [
        .short: "1.1",
        .shortWithName: "AppVersion 1.1",
        .long: "1.1 (42)",
        .longWithName: "AppVersion 1.1 (42)"
    ]

    func testAllVersions() {
        let label = AppVersionLabel()
        for (format, value) in testResults {
            label.format = format
            XCTAssert( label.text == value)
        }
    }
}
