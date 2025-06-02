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
            type: .dynamic,
            targets: [DefaultTargetNamed.swiftUIAnimationShowcase]),
  
        .library(
            name: LibNamed.gameboyTransition,
            type: .dynamic, //botar o framework guarda chuva como dynamic de novo depois pra ver bug
            targets: [DefaultTargetNamed.gameboyTransition]),
        
            .library(
                name: LibNamed.testingPlayground,
                type: .dynamic, //botar o framework guarda chuva como dynamic de novo depois pra ver bug
                targets: [DefaultTargetNamed.testingPlayground]),
        
            .library(
                name: LibNamed.animationFoundation,
                type: .dynamic, //botar o framework guarda chuva como dynamic de novo depois pra ver bug
                targets: [DefaultTargetNamed.animationFoundation])
    ],
    dependencies: [
        .package(path: "../VentUI"),
//        .package(url: "https://github.com/msventurini/VentUI.git", branch: "main")
//        .package(url: "https://github.com/msventurini/VentUI.git", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: ExecutableTargetNamed.animationShowcaseApp,
            dependencies: [.target(name: DefaultTargetNamed.swiftUIAnimationShowcase)]
        ),
        .target(
            name: DefaultTargetNamed.swiftUIAnimationShowcase,
            dependencies: [
                .target(name: DefaultTargetNamed.gameboyTransition)
            ]
        ),
        
        
        .target(
            name: DefaultTargetNamed.gameboyTransition,
            dependencies: [
                .product(name: "SwiftUIComponentKit", package: "VentUI"),
                //                .target(name: "SwiftUIComponentKit"),
                
                    .target(name: DefaultTargetNamed.animationFoundation)
            ], swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        
        .target(name: DefaultTargetNamed.animationFoundation, swiftSettings: [.swiftLanguageMode(.v6)]),
        .target(
            name: DefaultTargetNamed.testingPlayground,
            dependencies: [
                .target(name: DefaultTargetNamed.animationFoundation)
            ],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
    ]
)

enum Pkg {
    static let name: String = "swiftui-animation-showcase"
    
    enum Product {
        enum Library {
            enum Named {
                static let gameboyTransition: String = "GameboyTransition"
                static let swiftUIAnimationShowcase: String = "SwiftUIAnimationShowcase"
                static let testingPlayground: String = "TestingPlayground"
                static let animationFoundation: String = "AnimationFoundation"
            }
        }
    }
    
    enum Target {
        
        enum DefaultType {
            enum Named {
                static let gameboyTransition: String = "GameboyTransition"
                static let swiftUIAnimationShowcase: String = "SwiftUIAnimationShowcase"
                static let testingPlayground: String = "TestingPlayground"
                static let animationFoundation: String = "AnimationFoundation"


            }
        }
        
        enum Executable {
            
            enum Named {
                static let animationShowcaseApp: String = "AnimationShowcaseApp"
                
            }
            
        }
    }
}


