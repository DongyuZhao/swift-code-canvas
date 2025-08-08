import CodeShell
import Foundation

#if canImport(SwiftUI)
  import SwiftUI

  @main
  struct CodeShellShowCaseApp: App {
    #if os(macOS)
      // Ensure the app shows in Dock, has menu bar, and supports full screen when launched as a SwiftPM executable
      @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif
    var body: some Scene {
      WindowGroup("") {
        CodeShell()
      }
    }
  }
  #if os(macOS)
    import AppKit
    final class AppDelegate: NSObject, NSApplicationDelegate {
      func applicationDidFinishLaunching(_ notification: Notification) {
        // Switch activation policy to regular so we have Dock icon and menu bar
        NSApp.setActivationPolicy(.regular)
        NSApp.activate(ignoringOtherApps: true)
      }
    }
  #endif
#endif
