#if canImport(SwiftUI)
  import SwiftUI

  public struct CodeSpaceContainer: View {
    @EnvironmentObject private var store: CodeCanvasStore

    public init() {}

    public var body: some View {
      if let workspace = store.workspace {
        workspace.content()
      } else {
        Text("Canvas")
      }
    }
  }
#endif
