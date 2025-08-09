#if canImport(SwiftUI)
import SwiftUI
import CodeCanvas

public struct CodeEditorWorkspace: CodeCanvasWorkspace {
    public let id = UUID().uuidString
    let file: CodeCanvasFile

    public func content() -> AnyView {
        AnyView(
            VStack(alignment: .leading) {
                Text("Editing: \(file.name)")
                    .font(.headline)
                ScrollView {
                    Text(file.content)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        )
    }
}

public struct CodeCanvasBenchFileCollection: CodeCanvasBenchComponent {
    public let id: String = UUID().uuidString
    public let title: String = "File Collection"
    public let icon: String = "folder"
    public var actions: [any CodeCanvasBenchAction] = []

    private let files: [CodeCanvasFile]

    public init(files: [CodeCanvasFile] = [
        CodeCanvasFile(id: "1", name: "Example.swift", content: "print(\"Hello\")"),
        CodeCanvasFile(id: "2", name: "Data.json", content: "{\n  \"value\": 42\n}")
    ]) {
        self.files = files
    }

    public func content() -> AnyView {
        AnyView(FileCollectionView(files: files))
    }

    struct FileCollectionView: View {
        @EnvironmentObject var store: CodeCanvasStore
        let files: [CodeCanvasFile]

        var body: some View {
            List(files) { file in
                Button(file.name) {
                    store.open(CodeEditorWorkspace(file: file))
                }
            }
        }
    }
}

public struct CodeEditorBench: CodeCanvasBench {
    public let id: String = UUID().uuidString
    public let name: String = "Editor"
    public let icon: String = "document"
    public let components: [CodeCanvasBenchComponent] = [CodeCanvasBenchFileCollection()]
}
#endif
