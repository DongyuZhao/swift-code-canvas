public struct CodeCanvasFile {
    public let id: String
    public let name: String
    public let content: String

    public init(id: String, name: String, content: String) {
        self.id = id
        self.name = name
        self.content = content
    }
}
