#if canImport(SwiftUI)
  import SwiftUI

  public struct CodeCanvasShell: View {
    private let extensions: [CodeCanvasExtension]

    @State private var showInspector = false
    @StateObject private var store = CodeCanvasStore()

    public init(extensions: [CodeCanvasExtension]) {
        self.extensions = extensions
    }

    public var body: some View {
      NavigationSplitView {
        CodeBenchContainer(benches: extensions.flatMap { $0.benches })
      } detail: {
        CodeSpaceContainer()
      }
      .environmentObject(store)
      .inspector(
        isPresented: $showInspector,
        content: {
          CodeInspectorContainer()
            #if os(macOS)
              .inspectorColumnWidth(min: 340, ideal: 340, max: 680)
            #endif
            .toolbar {
                Spacer()
              Button(action: {
                showInspector.toggle()
              }) {
                Label("Toggle Inspector", systemImage: "sidebar.right")
              }
            }
        }
      )
    }
  }

#endif
