import XCTest

class ATEA_BaseTests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        XCUIApplication().terminate()

        try super.setUpWithError()

        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        XCUIApplication().terminate()
    }

}
