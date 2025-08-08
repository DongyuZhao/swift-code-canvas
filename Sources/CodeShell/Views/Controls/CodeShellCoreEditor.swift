import SwiftUI
#if canImport(AppKit)
import AppKit
#elseif canImport(UIKit)
import UIKit
#endif

public struct CodeShellCoreEditor: View {
	public struct Config: Equatable, Sendable {
		public var font: Font
		public var spacing: CGFloat
		public var padding: EdgeInsets
		public var lineNumberColor: Color
		public var lineNumberBackgroundColor: Color
		public var currentLineHighlightColor: Color
		public var backgroundColor: Color
		public var textColor: Color

		public static let `default` = Config(
			font: .system(.body, design: .monospaced),
			spacing: 2,
			padding: EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0),
			lineNumberColor: Color(NSColor.secondaryLabelColor),
			lineNumberBackgroundColor: Color(NSColor.controlBackgroundColor),
			currentLineHighlightColor: Color(NSColor.selectedTextBackgroundColor).opacity(0.3),
			backgroundColor: Color(NSColor.textBackgroundColor),
			textColor: Color(NSColor.textColor)
		)

		public init(
			font: Font,
			spacing: CGFloat = 2,
			padding: EdgeInsets = EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0),
			lineNumberColor: Color = Color(NSColor.secondaryLabelColor),
			lineNumberBackgroundColor: Color = Color(NSColor.controlBackgroundColor),
			currentLineHighlightColor: Color = Color(NSColor.selectedTextBackgroundColor).opacity(0.3),
			backgroundColor: Color = Color(NSColor.textBackgroundColor),
			textColor: Color = Color(NSColor.textColor)
		) {
			self.font = font
			self.spacing = spacing
			self.padding = padding
			self.lineNumberColor = lineNumberColor
			self.lineNumberBackgroundColor = lineNumberBackgroundColor
			self.currentLineHighlightColor = currentLineHighlightColor
			self.backgroundColor = backgroundColor
			self.textColor = textColor
		}
	}

	// MARK: - Callbacks
	public typealias SyntaxHighlightCallback = (String) -> AttributedString
	public typealias AutoCompletionCallback = (String, Int) -> [CompletionItem]

	public struct CompletionItem: Identifiable {
		public let id = UUID()
		public let text: String
		public let detail: String?
		public let kind: CompletionKind

		public enum CompletionKind {
			case keyword, function, variable, type, snippet
		}

		public init(text: String, detail: String? = nil, kind: CompletionKind = .variable) {
			self.text = text
			self.detail = detail
			self.kind = kind
		}
	}

	@State private var file: CodeShellCoreFile
	@State private var currentLine: Int = 1
	@State private var cursorPosition: Int = 0
	@State private var selectedRange: NSRange = NSRange(location: 0, length: 0)
	@State private var completionItems: [CompletionItem] = []
	@State private var showCompletions: Bool = false
	@State private var completionPosition: CGPoint = .zero

	private let onUpdate: (CodeShellCoreFile) -> Void
	private let config: Config
	private let fileURL: URL?
	private let syntaxHighlight: SyntaxHighlightCallback?
	private let autoCompletion: AutoCompletionCallback?

	public init(
		file: CodeShellCoreFile,
		fileURL: URL? = nil,
		config: Config = .default,
		syntaxHighlight: SyntaxHighlightCallback? = nil,
		autoCompletion: AutoCompletionCallback? = nil,
		onUpdate: @escaping (CodeShellCoreFile) -> Void = { _ in }
	) {
		self._file = State(initialValue: file)
		self.config = config
		self.onUpdate = onUpdate
		self.fileURL = fileURL
		self.syntaxHighlight = syntaxHighlight
		self.autoCompletion = autoCompletion
	}

	public var body: some View {
		VStack(spacing: 0) {
			CodeShellBreadcrumb(url: file.path)
				.padding(.horizontal, 8)

			// Editor Area
		}
	}
}
