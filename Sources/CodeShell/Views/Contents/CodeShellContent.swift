import SwiftUI

// 引入模型
import Foundation

public struct CodeShellContent: View {
  // 仅作为初始值传入，状态由 CodeShellCoreEditor 内部维护
  private let initialFile: CodeShellCoreFile = .init(
    path: URL(fileURLWithPath: "main.swift"),
    content: """
    // Welcome to CodeShell
    // 在这里输入你的 Swift 代码...
    print(\"Hello, CodeShell!\")
    """
  )

  public init() {}

  public var body: some View {
    CodeShellCoreEditor(file: initialFile)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}
