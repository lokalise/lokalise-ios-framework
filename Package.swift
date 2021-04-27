// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
  name: "lokalise-ios-framework",
  platforms: [.iOS(.v11)],
  products: [
    .library(name: "lokalise-ios-framework",
             targets: ["Lokalise"])
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "lokalise-ios-framework",
      dependencies: ["Lokalise"]
    ),
    .binaryTarget(
       name: "Lokalise",
       url: "https://github.com/lokalise/lokalise-ios-framework/releases/download/0.10.2/Lokalise.xcframework.0.10.2.zip",
       checksum: "9e7c9ede0cc2092d3b86538e0b5c2244ed1d2f32323188a45f1dd06366a68be6"
    )
  ]
)
