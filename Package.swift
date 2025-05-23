// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

typealias LibNamed = Pkg.Product.Library.Named
typealias DefaultTargetNamed = Pkg.Target.DefaultType.Named
typealias ExecutableTargetNamed = Pkg.Target.Executable.Named

let package = Package(
    name: Pkg.name,
    platforms: [
        .iOS(.v18),
        .macCatalyst(.v18),
        .macOS(.v15)
    ],
    products: [
        .executable(
            name: ExecutableTargetNamed.animationShowcaseApp,
            targets: [ExecutableTargetNamed.animationShowcaseApp]
        ),
        .library(
            name: LibNamed.swiftUIAnimationShowcase,
            type: .static,
            targets: [DefaultTargetNamed.swiftUIAnimationShowcase]),
        .library(
            name: LibNamed.kirbyJumping,
            type: .dynamic,
            targets: [DefaultTargetNamed.kirbyJumping]),
        
        .library(
            name: LibNamed.gameboyTransition,
            type: .dynamic, //botar o framework guarda chuva como dynamic de novo depois pra ver bug
            targets: [DefaultTargetNamed.gameboyTransition])
    ],
    targets: [
        .executableTarget(
            name: ExecutableTargetNamed.animationShowcaseApp,
            dependencies: [.target(name: DefaultTargetNamed.swiftUIAnimationShowcase)]
        ),
        .target(
            name: DefaultTargetNamed.swiftUIAnimationShowcase,
            dependencies: [
                .target(name: DefaultTargetNamed.kirbyJumping),
                .target(name: DefaultTargetNamed.gameboyTransition)
            ]
        ),
        .target(name: DefaultTargetNamed.kirbyJumping),
        .target(name: DefaultTargetNamed.gameboyTransition),
    ]
)

enum Pkg {
    static let name: String = "swiftui-animation-showcase"
    
    enum Product {
        enum Library {
            enum Named {
                static let kirbyJumping: String = "KirbyJumpingAnimation"
                static let gameboyTransition: String = "GameboyTransition"
                static let swiftUIAnimationShowcase: String = "SwiftUIAnimationShowcase"
            }
        }
    }
    
    enum Target {
        
        enum DefaultType {
            enum Named {
                static let kirbyJumping: String = "KirbyJumpingAnimation"
                static let gameboyTransition: String = "GameboyTransition"
                static let swiftUIAnimationShowcase: String = "SwiftUIAnimationShowcase"
            }
        }
        
        enum Executable {
            
            enum Named {
                static let animationShowcaseApp: String = "AnimationShowcaseApp"
                
            }
            
        }
    }
}


