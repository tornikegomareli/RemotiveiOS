// swift-tools-version:5.8
import PackageDescription

let package = Package(
  name: "Remotive",
  platforms: [
    .iOS(.v15),
    .macOS(.v13),
  ],
  products: [
    .library(
      name: "Remotive",
      targets: ["Remotive"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.53.2"),
    .package(url: "https://github.com/Moya/Moya", from: "15.0.3")
  ],
  targets: [
    .target(
      name: "Remotive",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
        .product(name: "Moya", package: "moya"),
        .product(name: "CombineMoya", package: "moya")
      ],
      path: "Sources/"
    ),
    .testTarget(
      name: "RemotiveTests",
      dependencies: ["Remotive"],
      path: "Tests/"
    ),
  ]
)
