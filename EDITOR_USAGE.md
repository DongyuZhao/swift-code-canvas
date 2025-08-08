# CodeShellCoreEditor 使用指南

## 概述

`CodeShellCoreEditor` 是一个具有 Xcode 风格的代码编辑器组件，支持以下功能：

- 行号显示
- 当前行高亮
- 语法高亮回调
- LSP 自动补全回调
- 跨平台支持（macOS 使用 AppKit，iOS 使用 UIKit）

## 基本用法

```swift
import SwiftUI
import CodeShell

struct ContentView: View {
    @State private var file = CodeShellCoreFile(
        path: URL(fileURLWithPath: "/path/to/file.swift"),
        content: """
        func hello() {
            print("Hello, World!")
        }
        """
    )

    var body: some View {
        CodeShellCoreEditor(
            file: file,
            onUpdate: { updatedFile in
                // 处理文件更新
                print("File updated: \(updatedFile.content)")
            }
        )
    }
}
```

## 带语法高亮的用法

```swift
struct ContentView: View {
    @State private var file = CodeShellCoreFile(
        path: URL(fileURLWithPath: "/path/to/file.swift"),
        content: "func hello() {\n    print(\"Hello, World!\")\n}"
    )

    var body: some View {
        CodeShellCoreEditor(
            file: file,
            syntaxHighlight: { code in
                // 实现语法高亮逻辑
                var attributedString = AttributedString(code)

                // 示例：高亮关键字
                let keywords = ["func", "print", "let", "var", "if", "else"]
                for keyword in keywords {
                    if let range = attributedString.range(of: keyword) {
                        attributedString[range].foregroundColor = .blue
                        attributedString[range].font = .boldSystemFont(ofSize: 14)
                    }
                }

                return attributedString
            },
            onUpdate: { updatedFile in
                // 处理文件更新
            }
        )
    }
}
```

## 带自动补全的用法

```swift
struct ContentView: View {
    @State private var file = CodeShellCoreFile(
        path: URL(fileURLWithPath: "/path/to/file.swift"),
        content: ""
    )

    var body: some View {
        CodeShellCoreEditor(
            file: file,
            autoCompletion: { code, cursorPosition in
                // 实现 LSP 自动补全逻辑
                let completions: [CodeShellCoreEditor.CompletionItem] = [
                    CodeShellCoreEditor.CompletionItem(
                        text: "func",
                        detail: "Function declaration",
                        kind: .keyword
                    ),
                    CodeShellCoreEditor.CompletionItem(
                        text: "print(_:)",
                        detail: "Prints a value",
                        kind: .function
                    ),
                    CodeShellCoreEditor.CompletionItem(
                        text: "String",
                        detail: "String type",
                        kind: .type
                    )
                ]

                return completions
            },
            onUpdate: { updatedFile in
                // 处理文件更新
            }
        )
    }
}
```

## 自定义配置

```swift
struct ContentView: View {
    @State private var file = CodeShellCoreFile(
        path: URL(fileURLWithPath: "/path/to/file.swift"),
        content: "// Your code here"
    )

    private let customConfig = CodeShellCoreEditor.Config(
        font: .system(.body, design: .monospaced),
        spacing: 3,
        padding: EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8),
        lineNumberColor: .secondary,
        lineNumberBackgroundColor: .gray.opacity(0.1),
        currentLineHighlightColor: .blue.opacity(0.2),
        backgroundColor: .white,
        textColor: .black
    )

    var body: some View {
        CodeShellCoreEditor(
            file: file,
            config: customConfig,
            onUpdate: { updatedFile in
                // 处理文件更新
            }
        )
    }
}
```

## 完整示例：Swift 语法高亮和自动补全

```swift
import SwiftUI
import CodeShell

struct CodeEditorExample: View {
    @State private var file = CodeShellCoreFile(
        path: URL(fileURLWithPath: "/example.swift"),
        content: """
        import Foundation

        func greet(name: String) {
            print("Hello, \\(name)!")
        }

        greet(name: "World")
        """
    )

    var body: some View {
        VStack {
            Text("Swift Code Editor")
                .font(.title)
                .padding()

            CodeShellCoreEditor(
                file: file,
                syntaxHighlight: swiftSyntaxHighlighter,
                autoCompletion: swiftAutoCompletion,
                onUpdate: { updatedFile in
                    print("Code updated")
                }
            )
            .frame(minHeight: 400)
            .padding()
        }
    }

    private func swiftSyntaxHighlighter(_ code: String) -> AttributedString {
        var attributedString = AttributedString(code)

        // Swift 关键字
        let keywords = [
            "import", "func", "let", "var", "if", "else", "for", "while",
            "class", "struct", "enum", "protocol", "extension", "return",
            "private", "public", "internal", "fileprivate", "open"
        ]

        for keyword in keywords {
            let regex = try! NSRegularExpression(pattern: "\\b\(keyword)\\b")
            let nsString = code as NSString
            let matches = regex.matches(in: code, range: NSRange(location: 0, length: nsString.length))

            for match in matches {
                if let range = Range(match.range, in: attributedString) {
                    attributedString[range].foregroundColor = .purple
                    attributedString[range].font = .boldSystemFont(ofSize: 14)
                }
            }
        }

        // 字符串字面量
        let stringRegex = try! NSRegularExpression(pattern: "\".*?\"")
        let stringMatches = stringRegex.matches(in: code, range: NSRange(location: 0, length: (code as NSString).length))

        for match in stringMatches {
            if let range = Range(match.range, in: attributedString) {
                attributedString[range].foregroundColor = .red
            }
        }

        return attributedString
    }

    private func swiftAutoCompletion(_ code: String, cursorPosition: Int) -> [CodeShellCoreEditor.CompletionItem] {
        // 基本的 Swift 自动补全
        return [
            CodeShellCoreEditor.CompletionItem(
                text: "func",
                detail: "Function declaration",
                kind: .keyword
            ),
            CodeShellCoreEditor.CompletionItem(
                text: "print(_:)",
                detail: "Prints a value to standard output",
                kind: .function
            ),
            CodeShellCoreEditor.CompletionItem(
                text: "String",
                detail: "A Unicode string value",
                kind: .type
            ),
            CodeShellCoreEditor.CompletionItem(
                text: "Int",
                detail: "A signed integer value type",
                kind: .type
            ),
            CodeShellCoreEditor.CompletionItem(
                text: "Bool",
                detail: "A value type whose instances are either true or false",
                kind: .type
            )
        ]
    }
}
```

## 特性说明

### 行号显示
- 自动计算行号宽度
- 当前行行号高亮显示
- 行号区域有独立的背景色

### 当前行高亮
- 光标所在行自动高亮
- 可自定义高亮颜色和透明度

### 语法高亮
- 通过回调函数实现
- 返回 `AttributedString` 类型
- 支持多种文本属性（颜色、字体、样式等）

### 自动补全
- 基于当前代码和光标位置
- 支持不同类型的补全项（关键字、函数、变量、类型、代码片段）
- 弹出式补全菜单

### 跨平台支持
- macOS：使用 `NSTextView` 获得最佳性能和功能
- iOS：使用 `UITextView` 保证兼容性

## 注意事项

1. 语法高亮回调应该尽可能高效，避免阻塞 UI
2. 自动补全回调应该快速返回结果
3. 大文件可能需要考虑性能优化
4. 建议在后台线程进行复杂的语法分析
