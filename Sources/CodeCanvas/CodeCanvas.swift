import Foundation

#if canImport(SwiftUI)
import SwiftUI
#endif

/// Public entry-points for the CodeCanvas module.
public enum CodeCanvasAPI {
    /// Format the document text (placeholder using SwiftFormat later).
    public static func format(_ doc: CodeDocument) -> CodeDocument {
        // TODO: integrate real formatting via swift-format when needed.
        return doc
    }
}

#if canImport(SwiftUI)
/// A minimal SwiftUI-based editor view for Apple platforms.
public struct CodeCanvasView: View {
    @State private var text: String

    public init(initialText: String = "// Welcome to CodeCanvas\n") {
        self._text = State(initialValue: initialText)
    }

    public var body: some View {
        TextEditor(text: $text)
            .font(.system(.body, design: .monospaced))
            .padding()
    }
}
#endif
