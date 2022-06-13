// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Syntax",
    products: [
        .library(name: "Syntax",
                 targets: ["Syntax"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nerdsupremacist/SyntaxTree.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "Syntax",
                dependencies: ["SyntaxTree"]),

        .testTarget(name: "SyntaxTests",
                    dependencies: ["Syntax"]),
    ]
)
