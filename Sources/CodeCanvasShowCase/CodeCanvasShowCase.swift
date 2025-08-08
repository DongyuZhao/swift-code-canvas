import Foundation
import CodeCanvas

#if canImport(SwiftUI)
import SwiftUI

@main
struct CodeCanvasShowCaseApp: App {
    var body: some Scene {
        WindowGroup {
            CodeCanvasView(initialText: "// CodeCanvas Showcase\nprint(\"Hello, world!\")\n")
        }
    }
}
#else
@main
struct CodeCanvasShowCaseCLI {
    static func main() {
        let doc = CodeDocument(text: "// CodeCanvas Showcase CLI\nprint(\"Hello, world!\")\n")
        let tui = CodeCanvasTUI()
        tui.start(with: doc)
    }
}
#endif
