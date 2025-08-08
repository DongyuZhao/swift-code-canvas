import SwiftUI

public class CodeShellTheme: ObservableObject {
    public let icons: [String: String] // SF Symbol 名称
    public let iconColors: [String: Color] // 图标颜色

    public init() {
        // 文件夹图标映射
        let folderIcons: [String: String] = [
            "documents": "doc.folder",
            "文档": "doc.folder",
            "downloads": "square.and.arrow.down.on.square",
            "下载": "square.and.arrow.down.on.square",
            "desktop": "desktopcomputer",
            "桌面": "desktopcomputer",
            "pictures": "photo.on.rectangle",
            "图片": "photo.on.rectangle",
            "music": "music.note.house",
            "音乐": "music.note.house",
            "movies": "video.circle",
            "影片": "video.circle",
            "applications": "app.gift",
            "应用程序": "app.gift",
            "library": "books.vertical",
            "资源库": "books.vertical",
            "src": "folder.badge.gearshape",
            "source": "folder.badge.gearshape",
            "sources": "folder.badge.gearshape",
            "test": "testtube.2",
            "tests": "testtube.2",
            "build": "hammer",
            "builds": "hammer",
            "dist": "shippingbox",
            "distribution": "shippingbox",
            "node_modules": "folder.badge.minus",
            ".git": "folder.badge.minus",
            "~": "house",
            "home": "house"
        ]

        // 文件扩展名图标映射
        let fileExtensionIcons: [String: String] = [
            // Swift 相关
            "swift": "swift",

            // 代码文件
            "js": "doc.text",
            "jsx": "doc.text",
            "ts": "doc.text",
            "tsx": "doc.text",
            "py": "doc.text",
            "java": "doc.text",
            "kt": "doc.text",
            "cpp": "doc.text",
            "c": "doc.text",
            "h": "doc.text",
            "hpp": "doc.text",
            "cs": "doc.text",
            "go": "doc.text",
            "rs": "doc.text",
            "php": "doc.text",
            "rb": "doc.text",

            // 配置文件
            "json": "doc.badge.gearshape",
            "xml": "doc.badge.gearshape",
            "yaml": "doc.badge.gearshape",
            "yml": "doc.badge.gearshape",
            "toml": "doc.badge.gearshape",
            "plist": "list.bullet.rectangle",
            "env": "gearshape.2",
            "config": "gearshape.2",
            "ini": "gearshape.2",
            "conf": "gearshape.2",

            // 文档文件
            "md": "doc.richtext",
            "markdown": "doc.richtext",
            "txt": "doc.plaintext",
            "log": "doc.plaintext",
            "pdf": "doc.richtext",
            "doc": "doc.text",
            "docx": "doc.text",
            "rtf": "doc.richtext",

            // 图片文件
            "png": "photo",
            "jpg": "photo",
            "jpeg": "photo",
            "gif": "photo",
            "bmp": "photo",
            "tiff": "photo",
            "webp": "photo",
            "svg": "photo.artframe",
            "ico": "app",

            // 音频文件
            "mp3": "music.note",
            "wav": "music.note",
            "aac": "music.note",
            "flac": "music.note",
            "m4a": "music.note",

            // 视频文件
            "mp4": "video",
            "mov": "video",
            "avi": "video",
            "mkv": "video",
            "webm": "video",

            // 压缩文件
            "zip": "archivebox",
            "rar": "archivebox",
            "7z": "archivebox",
            "tar": "archivebox",
            "gz": "archivebox",
            "bz2": "archivebox",

            // 可执行文件
            "app": "app.badge",
            "exe": "app.badge",
            "dmg": "app.badge",
            "pkg": "app.badge",

            // 字体文件
            "ttf": "textformat",
            "otf": "textformat",
            "woff": "textformat",
            "woff2": "textformat",

            // 数据库文件
            "db": "cylinder",
            "sqlite": "cylinder",
            "sql": "cylinder"
        ]

        // 特殊文件名图标映射
        let specialFileIcons: [String: String] = [
            "readme": "book",
            "readme.md": "book",
            "readme.txt": "book",
            "license": "doc.text.below.ecg",
            "license.txt": "doc.text.below.ecg",
            "license.md": "doc.text.below.ecg",
            "changelog": "clock.arrow.circlepath",
            "changelog.md": "clock.arrow.circlepath",
            "changelog.txt": "clock.arrow.circlepath",
            "package.json": "shippingbox",
            "package-lock.json": "shippingbox",
            "dockerfile": "cube.box",
            "makefile": "hammer",
            ".gitignore": "eye.slash",
            ".gitkeep": "eye.slash",
            "package.swift": "swift"
        ]

        // 合并所有图标映射
        var allIcons: [String: String] = [:]
        allIcons.merge(folderIcons) { _, new in new }
        allIcons.merge(fileExtensionIcons) { _, new in new }
        allIcons.merge(specialFileIcons) { _, new in new }

        self.icons = allIcons

        // 图标颜色映射
        self.iconColors = [
            "swift": .orange,
            "js": .yellow,
            "jsx": .yellow,
            "ts": .yellow,
            "tsx": .yellow,
            "py": .blue,
            "java": .red,
            "kt": .red,
            "cpp": .blue,
            "c": .blue,
            "h": .blue,
            "hpp": .blue,
            "cs": .purple,
            "go": .cyan,
            "rs": .orange,
            "php": .purple,
            "rb": .red,
            "json": .green,
            "xml": .green,
            "yaml": .green,
            "yml": .green,
            "md": .blue,
            "markdown": .blue,
            "png": .pink,
            "jpg": .pink,
            "jpeg": .pink,
            "gif": .pink,
            "bmp": .pink,
            "tiff": .pink,
            "webp": .pink,
            "svg": .pink,
            "mp3": .purple,
            "wav": .purple,
            "aac": .purple,
            "flac": .purple,
            "m4a": .purple,
            "mp4": .red,
            "mov": .red,
            "avi": .red,
            "mkv": .red,
            "webm": .red,
            "zip": .orange,
            "rar": .orange,
            "7z": .orange,
            "tar": .orange,
            "gz": .orange,
            "bz2": .orange
        ]
    }

    public func iconName(for fileName: String, isDirectory: Bool) -> String {
        if isDirectory {
            return icons[fileName.lowercased()] ?? "folder"
        } else {
            let fileExtension = (fileName as NSString).pathExtension.lowercased()
            return icons[fileExtension] ?? icons[fileName.lowercased()] ?? "doc"
        }
    }

    public func iconColor(for fileName: String, isDirectory: Bool) -> Color {
        if isDirectory {
            return .blue
        } else {
            let fileExtension = (fileName as NSString).pathExtension.lowercased()
            return iconColors[fileExtension] ?? .secondary
        }
    }
}
