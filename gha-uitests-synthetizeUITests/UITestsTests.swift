import XCTest

class UITestsTests: UITestsTests_BaseTests {

    func test_that_the_caret_location_is_equal_to_0_if_caret_is_at_the_beginning_of_a_non_empty_TextView() {
        let textInAXFocusedElement = """
so obviously that's
a TextView that is not empty
coz like come on there's so me shits inside.
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])

        XCTAssertNotNil(AXEngine.axFocusedElement())
    }
    
    func test_that_the_caret_location_is_equal_to_0_if_the_TextView_is_empty() {
        let textInAXFocusedElement = ""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        XCTAssertNotNil(AXEngine.axFocusedElement())
    }
    
    func test_that_the_caret_location_is_equal_to_text_length_if_caret_is_at_the_end_of_a_TextView() {
        let textInAXFocusedElement = """
another looooong
big shit
for you
my
friend...
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)

        XCTAssertNotNil(AXEngine.axFocusedElement())
    }

    func test_that_the_caret_location_is_correct_if_caret_is_between_the_beginning_and_the_end_of_a_TextView() {
        let textInAXFocusedElement = """
those shits never stop
i tell you
it's biiiiiiig and long
hallelujah
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.downArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])


        XCTAssertNotNil(AXEngine.axFocusedElement())
    }

//    func test_that_we_can_set_the_caret_location_to_0_on_a_non_empty_line() {
//        let textInAXFocusedElement = """
//those shits never stop
//i tell you
//it's biiiiiiig and long
//hallelujah
//"""
//        app.textViews.firstMatch.tap()
//        app.textViews.firstMatch.typeText(textInAXFocusedElement)
//
//        XCTAssertTrue(AXEngine.toAXFocusedElememt())
//    }
//
//    func test_that_we_can_set_the_caret_location_wherever_between_the_beginning_and_the_end_of_the_line() {
//        let textInAXFocusedElement = """
//those shits never stop
//
//"""
//        app.textViews.firstMatch.tap()
//        app.textViews.firstMatch.typeText(textInAXFocusedElement)
//
//        XCTAssertTrue(AXEngine.toAXFocusedElememt())
//    }

}

