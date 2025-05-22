// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: AnimationPkg.name,
    platforms: [
        .iOS(.v18),
        .macCatalyst(.v18)
    ],
    products: [
        .library(
            name: AnimationPkg.Lib.agregatedLibrary,
            targets: [AnimationPkg.Lib.agregatedLibrary]),
        .library(
            name: AnimationPkg.Lib.kirbyJumpingAnimation,
            targets: [AnimationPkg.Lib.kirbyJumpingAnimation]),
    ],
    targets: [
        .target(name: AnimationPkg.Lib.agregatedLibrary),
        .target(name: AnimationPkg.Lib.kirbyJumpingAnimation)
    ]
)

struct AnimationPkg {
    
    static let name = "SwiftUIAnimationShowcase"
    
    struct Lib {
        static let agregatedLibrary = AnimationPkg.name
        static let kirbyJumpingAnimation = "KirbyJumpingAnimation"
    }
    
    
}
