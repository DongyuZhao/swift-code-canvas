public struct CodeCanvasExtension {
    public let name: String
    public let icon: String
    public let benches: [CodeCanvasBench]

    public init(name: String, icon: String, benches: [CodeCanvasBench]) {
        self.name = name
        self.icon = icon
        self.benches = benches
    }
}
