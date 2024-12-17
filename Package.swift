// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "CallableKitCodegen",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "codegen", targets: ["Codegen"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.2"),
        .package(url: "https://github.com/omochi/CodableToTypeScript.git", from: "3.0.2"),
        .package(url: "https://github.com/omochi/SwiftTypeReader.git", from: "3.1.0"),
    ],
    targets: [
        .executableTarget(
            name: "Codegen",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "CodegenImpl",
            ]
        ),
        .target(
            name: "CodegenImpl",
            dependencies: [
                "CodableToTypeScript",
                "SwiftTypeReader",
            ],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals"),
            ]
        ),
    ]
)
