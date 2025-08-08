import Foundation

/// A minimal in-memory text document used by CodeCanvas.
public struct CodeDocument: Sendable, Equatable {
    public var text: String

    public init(text: String = "") {
        self.text = text
    }
}
