//
//  AnimatableTestingShape.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//

import SwiftUI
import AnimationFoundation

struct AnimatableTestingShape: Shape, Animatable {
    
    var position: AnimatablePosition = .zero
    var size: AnimatableSize = .zero
    
    
    var animatableData: AnimatablePair<AnimatablePosition, AnimatableSize> {
        get {
           AnimatablePair(position, size)
        }

        set {
            position = newValue.first
            size = newValue.second
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: position.cgPoint)
        path.addLine(to: CGPoint(x: 0, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: size.width, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: size.height))

        return path
    }
    
    
}


#Preview {
    
    @Previewable @State var isTapped: Bool = false
    
    AnimatableTestingShape(position: isTapped ? .init(x: 80, y: 80) : .zero, size: isTapped ? .init(width: 240, height: 300) : .init(width: 100, height: 400))
        .frame(width: 300, height: 300)
        .onTapGesture {
            withAnimation {
                isTapped.toggle()
            }
        }
}
