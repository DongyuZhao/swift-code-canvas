import Foundation
#if canImport(SwiftUI)
import SwiftUI
#endif

/// 表示一个可在编辑器中打开的核心文件。
public struct CodeShellCoreFile: Identifiable, Hashable, Codable, Sendable {
    public let id: UUID
    public var path: URL
    public var content: String

    public init(id: UUID = UUID(), path: URL, content: String) {
        self.id = id
        self.path = path
        self.content = content
    }
}
