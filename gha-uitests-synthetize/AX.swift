import Foundation

struct AX{

    static func axFocusedElement() -> AXUIElement? {
        let axSystemWideElement = AXUIElementCreateSystemWide()

        var axFocusedElement: AnyObject?
        guard AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success else { return nil }

        return axFocusedElement as! AXUIElement?
    }

    static func axLineNumberFor(location: Int, on axFocusedElement: AXUIElement? = axFocusedElement()) -> Int? {
        if let axFocusedElement = axFocusedElement {
            var currentLine: AnyObject?
            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, location as CFTypeRef, &currentLine)

            if error == .success {
                return (currentLine as! Int)
            }
        }

        return nil
    }

    static func axLineRangeFor(lineNumber: Int, on axFocusedElement: AXUIElement? = axFocusedElement()) -> CFRange? {
        if let axFocusedElement = axFocusedElement {
            var lineRangeValue: AnyObject?
            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXRangeForLineParameterizedAttribute as CFString, lineNumber as CFTypeRef, &lineRangeValue)

            if error == .success {
                var lineRange = CFRange()
                AXValueGetValue(lineRangeValue as! AXValue, .cfRange, &lineRange)

                return lineRange
            }
        }

        return nil
    }

    static func toAXFocusedElememt() -> Bool {
        guard let axFocusedElement = AX.axFocusedElement() else { return false }

        var selectedTextRange = CFRange()
        selectedTextRange.location = 1
        selectedTextRange.length = 0

        let newValue = AXValueCreate(.cfRange, &selectedTextRange)

        guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, newValue!) == .success else { return false }

        return true
    }

}
