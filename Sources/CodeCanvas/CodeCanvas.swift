#if canImport(SwiftUI)
import SwiftUI

public struct CodeCanvas: View {
    private let extensions: [CodeCanvasExtension]

    public init(extensions: [CodeCanvasExtension]) {
        self.extensions = extensions
    }

    public var body: some View {
        CodeCanvasShell(extensions: extensions)
    }
}

#else

public struct CodeCanvas {
    public init() {}

    public func start() {
        CodeCanvasTUI().start()
    }
}

#endif
