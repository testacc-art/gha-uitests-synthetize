import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var appComponent = AppComponent()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        #if targetEnvironment(simulator)
        // Disable hardware keyboards.
        let setHardwareLayout = NSSelectorFromString("setHardwareLayout:")
        UITextInputMode.activeInputModes
            .filter({ $0.responds(to: setHardwareLayout) })
            .forEach { $0.perform(setHardwareLayout, with: nil) }
        #endif
        appComponent.setUp()
    }

}
