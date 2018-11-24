//
//  AppVersionTests.swift
//  AppVersionTests
//

import XCTest
@testable import AppVersion

class AppVersionTests: XCTestCase {
    let testResults: [VersionFormat: String]  = [
        .short: "1.1",
        .shortWithName: "AppVersion 1.1",
        .long: "1.1 (42)",
        .longWithName: "AppVersion 1.1 (42)"
    ]

    func testShortVersion() {
        XCTAssert(AppVersion.shortVersion == testResults[.short])
    }

    func testShortVersionWithName() {
        XCTAssert(AppVersion.shortVersionWithName == testResults[.shortWithName])
    }

    func testLongVersion() {
        XCTAssert(AppVersion.longVersion == testResults[.long])
    }

    func testLongVersionWithName() {
        XCTAssert(AppVersion.longVersionWithName == testResults[.longWithName])
    }

    func testAllVersions() {
        for (format, value) in testResults {
            XCTAssert(AppVersion.version(with: format) == value)
        }
    }

}
