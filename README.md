# swift-code-canvas

Swift package that provides a SwiftUI-based code canvas for Apple platforms (iOS/macOS) and a Swift TUI-style canvas for non-Apple platforms (Linux/Windows). Consumers depend on the `CodeCanvas` library target, and `CodeCanvasShowCase` is a minimal sample app/CLI.

## Targets
- CodeCanvas (library)
	- On Apple platforms, exposes `CodeCanvasView` (SwiftUI) and simple APIs like `CodeCanvasAPI.format(_:)`.
	- On non-Apple platforms, exposes a minimal `CodeCanvasTUI` entry point.
- CodeCanvasShowCase (executable)
	- Apple: SwiftUI App embedding `CodeCanvasView`.
	- Others: CLI that prints the sample document via `CodeCanvasTUI`.

## Quick start
- Build library only:
	- macOS: `swift build --target CodeCanvas`
- Run showcase:
	- macOS (build app bundle): `swift build --target CodeCanvasShowCase`
	- Linux/Windows (CLI): `swift run CodeCanvasShowCase`

## Use in your app
```swift
import CodeCanvas
#if canImport(SwiftUI)
import SwiftUI

struct ContentView: View {
		var body: some View {
				CodeCanvasView(initialText: "// Hello CodeCanvas")
		}
}
#endif
```

## Tests
Minimal unit tests live in `Tests/CodeCanvasTests`. Run with:
```
swift test
```
