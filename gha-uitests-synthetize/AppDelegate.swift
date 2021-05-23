import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    lazy var appComponent = AppComponent()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        appComponent.setUp()

//        NSApplication.shared.hide(self)

        let contentView = ContentView()



        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        window.center()
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

}
