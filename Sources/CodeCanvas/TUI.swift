#if !canImport(SwiftUI)
import Foundation

/// Minimal TUI stub for non-Apple platforms (Linux/Windows).
public struct CodeCanvasTUI {
    public init() {}

    public func start(with document: CodeDocument) {
        // Placeholder TUI: just print the text for now.
        print(document.text)
    }
}
#endif
