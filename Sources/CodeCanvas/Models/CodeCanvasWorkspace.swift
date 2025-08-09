#if canImport(SwiftUI)
import SwiftUI

public protocol CodeCanvasWorkspace: Identifiable {
    func content() -> AnyView
}
#endif
