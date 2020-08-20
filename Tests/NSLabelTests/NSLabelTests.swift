import XCTest
@testable import NSLabel

final class NSLabelTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NSLabel().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
