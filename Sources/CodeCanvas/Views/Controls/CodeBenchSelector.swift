#if canImport(SwiftUI)
import SwiftUI

public struct CodeBenchSelector: View {
    private let benches: [CodeCanvasBench]
    private let onSelect: (CodeCanvasBench) -> Void

    @State private var selectedID: String?

    public init(benches: [CodeCanvasBench], onSelect: @escaping (CodeCanvasBench) -> Void) {
        self.benches = benches
        self.onSelect = onSelect
        self._selectedID = State(initialValue: benches.first?.id)
    }

    public var body: some View {
        VStack(spacing: 15) {
            ForEach(benches, id: \.id) { bench in
                Button(action: {
                    selectedID = bench.id
                    onSelect(bench)
                }) {
                    Image(systemName: bench.icon)
                        .font(.title)
                        .symbolVariant(selectedID == bench.id ? .fill : .none)
                        .frame(width: 50, height: 50)
                        .foregroundColor(selectedID == bench.id ? .accentColor : .secondary)
                        .background(
                            Color.secondary.opacity(selectedID == bench.id ? 0.25 : 0)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .buttonStyle(.plain)
                .help(bench.name)
            }
            Spacer()
        }
        .padding(.vertical)
        .frame(width: 60)
    }
}

#endif
