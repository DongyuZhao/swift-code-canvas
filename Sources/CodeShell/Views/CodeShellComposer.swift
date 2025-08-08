#if canImport(SwiftUI)
  import SwiftUI

  public struct CodeShellComposer: View {

    @State private var showInspector = false
    @StateObject private var theme = CodeShellTheme()

    public var body: some View {
      NavigationSplitView {
        CodeShellSideBar(title: "Work Bench")
      } detail: {
        VSplitView {
          CodeShellContent()
          CodeShellConsole()
        }
      }
      .environmentObject(theme)
      .inspector(
        isPresented: $showInspector,
        content: {
          CodeShellSideBar(title: "Inspector")
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
