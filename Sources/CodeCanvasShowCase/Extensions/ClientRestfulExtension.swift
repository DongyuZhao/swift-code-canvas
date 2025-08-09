#if canImport(SwiftUI)
import SwiftUI
import CodeCanvas

public struct ClientRestfulWorkspace: CodeCanvasWorkspace {
    public let id = UUID().uuidString
    let trace: String

    public func content() -> AnyView {
        AnyView(
            VStack {
                Text("Restful Client")
                    .font(.headline)
                Text(trace)
            }
            .padding()
        )
    }
}

public struct ClientRestfulTraceCollection: CodeCanvasBenchComponent {
    public let id: String = UUID().uuidString
    public let title: String = "Traces"
    public let icon: String = "network"
    public var actions: [any CodeCanvasBenchAction] = []

    private let traces: [String]

    public init(traces: [String] = ["GET /users", "POST /login"]) {
        self.traces = traces
    }

    public func content() -> AnyView {
        AnyView(TraceListView(traces: traces))
    }

    struct TraceListView: View {
        @EnvironmentObject var store: CodeCanvasStore
        let traces: [String]

        var body: some View {
            List(traces, id: \.self) { trace in
                Button(trace) {
                    store.open(ClientRestfulWorkspace(trace: trace))
                }
            }
        }
    }
}

public struct ClientRestfulBench: CodeCanvasBench {
    public let id: String = UUID().uuidString
    public let name: String = "Restful Client"
    public let icon: String = "network"
    public let components: [CodeCanvasBenchComponent] = [ClientRestfulTraceCollection()]
}
#endif
