// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Functor",
  platforms: [.iOS(.v18)],
  products: [
    .library(
      name: "Functor",
      targets: ["Functor"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Functor", dependencies: [
      ]),
  ])
