//
//  FramedShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//

import SwiftUI

struct SimpleCanvas: View, @preconcurrency Animatable {
    
    var shapeSize: AnimatableSize
    
    var animatableData: AnimatableSize {
        get {
            shapeSize
        }
        
        set {
            shapeSize = newValue
        }
    }
    var body: some View {
        Canvas(
            opaque: true,
            colorMode: .linear,
            rendersAsynchronously: false
        ) { context, size in
            
            let rect: CGRect = .init(origin: .zero, size: size)
            
            let path = Rectangle().path(in: rect)
            context.fill(path, with: .color(.red))
//
            let consolePath = ConsoleBodyShape(
                shapeSize: shapeSize
            )
                .path(in: .init(
                    origin: .zero,
                    size: shapeSize.cgSize)
                )
            context.fill(consolePath, with: .color(.yellow))
//
            
        }
    }
}

#Preview {
    
    @Previewable @State var isTapped: Bool = false
    
    ConsoleBodyShape(shapeSize: isTapped ? .init(width: 90, height: 148) : .init(width: 144, height: 82))
        .frame(width: 640, height: 600)
        .onTapGesture {
            withAnimation {
                isTapped.toggle()
            }
        }
}

struct ConsoleBodyShape: Shape, Animatable {
    
    var shapeSize: AnimatableSize
    
    var animatableData: AnimatableSize {
        get {
            shapeSize
        }
        
        set {
            shapeSize = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let dx: Double = (rect.size.width - shapeSize.width) * 0.5
        let dy: Double = (rect.size.height - shapeSize.height) * 0.5
        
        path.addRect(rect.insetBy(dx: dx, dy: dy))

        return path
        
    }
    
    
}

//
//@MainActor public static let dmg: Gameboy = .init(
//    model: .gameboyDMG,
//    screenBezelSize: CGSize(width: 70, height: 54),
//    bodyRect: .init(position: .init(x: 42.5, y: 13.5), size: .init(width: 90, height: 148)),
//    bodyColor: .init(red: 190/255, green: 190/255, blue: 190/255),
//    
//)//94 92 230
//
//@MainActor public static let advance: Gameboy = .init(
//    model: .gameboyAdvance,
//    screenBezelSize: CGSize(width: 70, height: 60),
//    bodyRect: .init(position: .init(x: 15.5, y: 46.5), size: .init(width: 144, height: 82)),
//    bodyColor: .init(red: 94/255, green: 92/255, blue: 230/255),
//    
//)
