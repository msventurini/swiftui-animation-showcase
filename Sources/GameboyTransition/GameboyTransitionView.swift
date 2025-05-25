//
//  GameboyTransitionView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 23/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation

public struct GameboyTransitionView: View {
    
    @State private var isClicked = false
    @State private var console: HandheldConsole = HandheldConsole.dmg
    
    public init() {
        
    }
    
    public var body: some View {
        
        
        VStack {
            
            ConsoleScreenPortion(bezelSize: .init(size: console.screenBezelSize), screenSize: .init(size: console.screenSize))
            
            
            LeftControlsPortion(bodyColor: console.bodyColor, numberOfButtons: console.numberOfButtons)
            
            
            RightControlsPortion(bodyColor: console.bodyColor)
            
        }
        .drawingGroup()
        .onTapGesture {
            withAnimation(.bouncy) {
                isClicked.toggle()
                console = console.toggled()
                
            }
        }
        
        
    }
}

#Preview {
    GameboyTransitionView()
}










//struct ConsoleBodyShape: Shape, Animatable {
//
//    var shapeSize: AnimatableSize
//
//    var animatableData: AnimatableSize {
//        get {
//            shapeSize
//        }
//
//        set {
//            shapeSize = newValue
//        }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        let dx: Double = (rect.size.width - shapeSize.width) * 0.5
//        let dy: Double = (rect.size.height - shapeSize.height) * 0.5
//
//        path.addRect(rect.insetBy(dx: dx, dy: dy))
//
//        return path
//
//    }
//
//}

//struct ConsoleScreenBezelShape: Shape, Animatable {
//
//    var shapeSize: AnimatableSize
//    var offsetSize: AnimatableSize
//
//    var animatableData: AnimatablePair<AnimatableSize, AnimatableSize> {
//        get {
//            AnimatablePair(shapeSize, offsetSize)
//        }
//
//        set {
//            shapeSize = newValue.first
//            offsetSize = newValue.second
//        }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        let dx: Double = (rect.size.width - shapeSize.width) * 0.5
//        let dy: Double = (rect.size.height - shapeSize.height) * 0.5
//
//        path.addRect(rect.insetBy(dx: dx, dy: dy).offsetBy(dx: offsetSize.width, dy: offsetSize.height))
//
//        return path
//
//    }
//
//}
