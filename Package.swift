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
       url: "https://github.com/lokalise/lokalise-ios-framework/raw/master/Lokalise.xcframework.zip",
       checksum: "2d26c78452fed3b29889d6c8e5bebc520b3d2acf400c82dde8d29100bc67ef7e"
    )
  ]
)
