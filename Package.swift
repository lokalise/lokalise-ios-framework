// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Lokalise",
  platforms: [.iOS(.v12)],
  products: [
    .library(name: "Lokalise",
             targets: ["Lokalise"])
  ],
  dependencies: [
  ],
  targets: [
    .binaryTarget(
       name: "Lokalise",
       url: "https://github.com/lokalise/lokalise-ios-framework/releases/download/1.0.2/Lokalise.xcframework.zip",
       checksum: "3bbc5d388c35f76b05214161de4ed2d024f7c966387b945c9b4653a8b5fd50a9"
    )
  ]
)