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
       url: "https://github.com/lokalise/lokalise-ios-framework/releases/download/1.0.0/Lokalise.xcframework.zip",
       checksum: "aeedd53f1540ae6fce0952c43fadc07fe20fa35f4304962e1e897c9d1ff452c8"
    )
  ]
)