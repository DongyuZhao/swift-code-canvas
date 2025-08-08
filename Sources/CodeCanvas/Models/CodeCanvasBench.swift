#if canImport(SwiftUI)
import Foundation
import SwiftUI

public protocol CodeCanvasBenchAction {
    var id: String { get }
    var title: String { get }
    var icon: String { get }
    func perform(on bench: CodeCanvasBench)
}

public protocol CodeCanvasBenchComponent{
    var id: String { get }
    var title: String { get }
    var icon: String { get }
    var actions: [CodeCanvasBenchAction] { get }
    func content() -> AnyView
}

public protocol CodeCanvasBench {
    var id: String { get }
    var name: String { get }
    var icon: String { get }
    var components: [CodeCanvasBenchComponent] { get }
}

#endif