import SwiftUI

public struct CodeShellSideBar: View {
  private let title: String
  public init(title: String) {
    self.title = title
  }

  public var body: some View {
    Text(title)
  }
}
