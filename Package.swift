// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Lokalise",
  platforms: [.iOS(.v11)],
  products: [
    .library(name: "Lokalise",
             targets: ["Lokalise"])
  ],
  dependencies: [
  ],
  targets: [
    .binaryTarget(
       name: "Lokalise",
       url: "https://github.com/lokalise/lokalise-ios-framework/releases/download/0.10.2/Lokalise.xcframework.0.10.2.zip",
       checksum: "9e7c9ede0cc2092d3b86538e0b5c2244ed1d2f32323188a45f1dd06366a68be6"
    )
  ]
)