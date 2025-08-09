#if canImport(SwiftUI)
  import SwiftUI

  public struct CodeBenchContainer: View {
    private let benches: [CodeCanvasBench]
    @State private var selectedBench: (any CodeCanvasBench)?
    @EnvironmentObject private var store: CodeCanvasStore

    public init(benches: [CodeCanvasBench]) {
        self.benches = benches
        _selectedBench = State(initialValue: benches.first)
    }

    public var body: some View {
        HStack(spacing: 0) {
            CodeBenchSelector(benches: benches) { bench in
                selectedBench = bench
                store.clear()
            }
            .frame(maxHeight: .infinity)

            if let selectedBench {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(selectedBench.components, id: \.id) { component in
                            DisclosureGroup {
                                component.content()
                            } label: {
                                HStack {
                                    Text(component.title).font(.headline)
                                    Spacer()
                                    ForEach(component.actions, id: \.id) { action in
                                        Button {
                                            action.perform(on: selectedBench)
                                        } label: {
                                            Image(systemName: action.icon)
                                        }
                                        .buttonStyle(.plain)
                                        .help(action.title)
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                Spacer()
            }
        }
    }
}

#endif
