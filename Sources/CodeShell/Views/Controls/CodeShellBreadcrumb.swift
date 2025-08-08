// CodeShellBreadcrum.swift
// 自动根据 URL 生成只读面包屑 (不响应点击)
//
// 约定: 仅展示路径组件, 过滤根分隔符("/"). 若包含用户主目录路径, 将主目录替换为 "~"。
// 使用: CodeShellBreadcrum(url: someURL)
//
// 后续可扩展: 点击交互 / 自定义分隔符 / 图标映射 / 溢出折叠 等。

import Foundation
#if canImport(SwiftUI)
import SwiftUI

public struct CodeShellBreadcrumb: View { // 面包屑仅展示路径
    public let url: URL
    private let components: [PathComponent]

    private struct PathComponent {
        let name: String
        let isDirectory: Bool
        let fullPath: String
    }

    public init(url: URL) {
        self.url = url
        self.components = Self.buildComponents(from: url)
    }

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                ForEach(Array(components.enumerated()), id: \.offset) { (idx, component) in
                    CodeShellPathComponent(
                        name: component.name,
                        isDirectory: component.isDirectory,
                        isLast: idx == components.count - 1
                    )
                }
            }
            .padding(.vertical, 2)
            .padding(.horizontal, 4)
        }
        .padding(.bottom, 2) // 与正文轻微分隔
    }
}

// MARK: - 构建路径组件
private extension CodeShellBreadcrumb {
    private static func buildComponents(from url: URL) -> [PathComponent] {
        let standardized = url.standardized
        var comps = standardized.pathComponents
        // 处理 root '/'
        comps.removeAll { $0 == "/" }

        // 展示 home 目录 ~
        if let home = FileManager.default.homeDirectoryForCurrentUser.standardized.pathComponents.last, !home.isEmpty {
            let homePath = FileManager.default.homeDirectoryForCurrentUser.standardized.path
            if standardized.path.hasPrefix(homePath) {
                // 用 ~ 替代前缀
                var rebuilt: [String] = ["~"]
                let suffix = standardized.path.replacingOccurrences(of: homePath, with: "")
                let rest = suffix.split(separator: "/").map(String.init).filter { !$0.isEmpty }
                rebuilt.append(contentsOf: rest)
                comps = rebuilt
            }
        }

        if comps.isEmpty {
            let lastComponent = standardized.lastPathComponent.isEmpty ? standardized.path : standardized.lastPathComponent
            let isDirectory = standardized.hasDirectoryPath
            return [PathComponent(name: lastComponent, isDirectory: isDirectory, fullPath: standardized.path)]
        }

        // 构建每个组件的完整路径并判断是否为目录
        var result: [PathComponent] = []
        var currentPath = ""

        for (index, component) in comps.enumerated() {
            if component == "~" {
                currentPath = FileManager.default.homeDirectoryForCurrentUser.path
                result.append(PathComponent(name: component, isDirectory: true, fullPath: currentPath))
            } else {
                currentPath = currentPath.isEmpty ? "/\(component)" : "\(currentPath)/\(component)"

                // 对于最后一个组件，使用原始 URL 的信息
                let isDirectory: Bool
                if index == comps.count - 1 {
                    isDirectory = standardized.hasDirectoryPath
                } else {
                    // 对于中间组件，检查是否为目录
                    var isDir: ObjCBool = false
                    let exists = FileManager.default.fileExists(atPath: currentPath, isDirectory: &isDir)
                    isDirectory = exists ? isDir.boolValue : true // 如果不存在，假设是目录
                }

                result.append(PathComponent(name: component, isDirectory: isDirectory, fullPath: currentPath))
            }
        }

        return result
    }
}

// MARK: - 预览 (仅在支持 SwiftUI 的平台编译)
#if DEBUG
struct CodeShellBreadcrum_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 12) {
            CodeShellBreadcrumb(url: URL(fileURLWithPath: "/Users/example/Projects/Repo/Sources/File.swift"))
            CodeShellBreadcrumb(url: URL(fileURLWithPath: FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Documents/Notes/note.md").path))
            CodeShellBreadcrumb(url: URL(fileURLWithPath: "/tmp/log.txt"))
        }
        .padding()
        .frame(width: 480)
        .previewLayout(.sizeThatFits)
    }
}
#endif

#endif
