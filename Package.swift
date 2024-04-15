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
       url: "https://github.com/lokalise/lokalise-ios-framework/releases/download/1.0.1/Lokalise.xcframework.zip",
       checksum: "7dd5cc275a2bd0d0353d90354cc2646a256f78a9cdb8792179e6abd850cfe31d"
    )
  ]
)