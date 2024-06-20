// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "Swift_SDL2_Base",
    platforms: [
        .macOS(.v11),
    ],
    dependencies: [
        .package(url: "https://github.com/ctreffs/SwiftSDL2.git", from: "1.4.1"),
    ],
    targets: [
        .executableTarget(
            name: "Swift_SDL2_Base",
            dependencies: [
                .product(name: "SDL", package: "SwiftSDL2")
            ],
            linkerSettings: [
                .linkedLibrary("SDL2", .when(platforms: [.windows])),
                .unsafeFlags(["-L", "C:\\SDL2\\lib\\x64"], .when(platforms: [.windows])),
                .unsafeFlags(["-I", "C:\\SDL2\\include"], .when(platforms: [.windows]))
            ]
        ),
    ]
)
