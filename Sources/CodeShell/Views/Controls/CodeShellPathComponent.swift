// CodeShellPathComponent.swift
// 用于显示带有图标的文件/文件夹路径组件
//
// 功能: 根据路径名称和类型自动选择合适的 SF Symbol 图标
// 使用: CodeShellPathComponent(name: "filename.swift", isDirectory: false)

import Foundation
#if canImport(SwiftUI)
import SwiftUI

public struct CodeShellPathComponent: View {
    public let name: String
    public let isDirectory: Bool
    public let isLast: Bool

    @EnvironmentObject private var theme: CodeShellTheme

    public init(name: String, isDirectory: Bool, isLast: Bool = false) {
        self.name = name
        self.isDirectory = isDirectory
        self.isLast = isLast
    }

    public var body: some View {
        HStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: theme.iconName(for: name, isDirectory: isDirectory))
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(theme.iconColor(for: name, isDirectory: isDirectory))

                Text(name)
                    .font(.system(.body))
                    .foregroundColor(isLast ? .primary : .secondary)
                    .lineLimit(1)
                    .truncationMode(.middle)
            }

            if !isLast {
                Image(systemName: "chevron.right")
                    .font(.system(size: 11, weight: .regular))
                    .foregroundColor(.secondary.opacity(0.7))
            }
        }
    }
}

// MARK: - 预览
#if DEBUG
struct CodeShellPathComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 文件夹示例
            CodeShellPathComponent(name: "Sources", isDirectory: true, isLast: false)
            CodeShellPathComponent(name: "Documents", isDirectory: true, isLast: false)
            CodeShellPathComponent(name: "~", isDirectory: true, isLast: false)

            Divider()

            // 文件示例
            CodeShellPathComponent(name: "CodeShell.swift", isDirectory: false, isLast: false)
            CodeShellPathComponent(name: "package.json", isDirectory: false, isLast: false)
            CodeShellPathComponent(name: "README.md", isDirectory: false, isLast: true)
            CodeShellPathComponent(name: "image.png", isDirectory: false, isLast: false)
            CodeShellPathComponent(name: "config.yaml", isDirectory: false, isLast: false)
        }
        .environmentObject(CodeShellTheme())
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif

#endif
