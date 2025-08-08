import XCTest
@testable import CodeCanvas

final class CodeCanvasTests: XCTestCase {
    func testDocumentInit() {
        let d = CodeDocument(text: "hello")
        XCTAssertEqual(d.text, "hello")
    }

    func testFormatIsIdentityForNow() {
        let d = CodeDocument(text: "print(\"hi\")")
        let formatted = CodeCanvasAPI.format(d)
        XCTAssertEqual(formatted, d)
    }
}
