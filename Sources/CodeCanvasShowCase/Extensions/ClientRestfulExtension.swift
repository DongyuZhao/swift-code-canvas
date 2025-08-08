#if canImport(SwiftUI)
import SwiftUI
import CodeCanvas

public struct ClientRestfulTraceCollection: CodeCanvasBenchComponent {
    public let id: String = UUID().uuidString

    public let title: String = "Traces"

    public let icon: String = "network"

    public var actions: [any CodeCanvasBenchAction] = []

    public func content() -> AnyView {
        AnyView(
            VStack {
                Text("No traces available")
                    .foregroundColor(.secondary)
                    .padding()
            }
        )
    }
}

public struct ClientRestfulBench: CodeCanvasBench {
    public let id: String = UUID().uuidString
    public let name: String = "Restful Client"
    public let icon: String = "network"
    public let components: [CodeCanvasBenchComponent] = [ClientRestfulTraceCollection()]
}

#endif
