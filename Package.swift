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
        .library(
            name: LibNamed.kirbyJumping,
            targets: [DefaultTargetNamed.kirbyJumping]),
    ],
    targets: [
        .executableTarget(name: ExecutableTargetNamed.macosDemoApp),
        .target(name: DefaultTargetNamed.kirbyJumping)
    ]
)

enum Pkg {
    static let name: String = "swiftui-animation-showcase"
    
    enum Product {
        enum Library {
            enum Named {
                static let kirbyJumping = "KirbyJumpingAnimation"
            }
        }
    }
    
    enum Target {
        
        enum DefaultType {
            enum Named {
                static let kirbyJumping = "KirbyJumpingAnimation"
            }
        }
        
        enum Executable {
            
            enum Named {
                static let macosDemoApp = "SwiftUIAnimationShowcase"
            }
            
        }
    }
}


