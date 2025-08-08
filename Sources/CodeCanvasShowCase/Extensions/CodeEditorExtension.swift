#if canImport(SwiftUI)
import SwiftUI
import CodeCanvas

public struct CodeCanvasBenchFileCollection: CodeCanvasBenchComponent {

    public let id: String = UUID().uuidString

    public let title: String = "File Collection"

    public let icon: String = "folder"

    public var actions: [any CodeCanvasBenchAction] = []

    public func content() -> AnyView {
        AnyView(
            VStack {
                Text("No files available")
                    .foregroundColor(.secondary)
                    .padding()
            }
        )
    }
}

public struct CodeEditorBench: CodeCanvasBench {
    public let id: String = UUID().uuidString
    public let name: String = "Editor"
    public let icon: String = "document"
    public let components: [CodeCanvasBenchComponent] = [CodeCanvasBenchFileCollection(), CodeCanvasBenchFileCollection()]
}

#endif
