#if canImport(SwiftUI)
import SwiftUI

public final class CodeCanvasStore: ObservableObject {
    @Published public var workspace: (any CodeCanvasWorkspace)?

    public init() {}

    public func open(_ workspace: any CodeCanvasWorkspace) {
        self.workspace = workspace
    }

    public func clear() {
        workspace = nil
    }
}
#endif
