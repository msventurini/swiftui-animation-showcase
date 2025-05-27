//
//  ConsoleScreenPortion.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation

struct ConsoleScreenPortion: View {
    
    var bezelSize: AnimatableSize
    var screenSize: AnimatableSize
    
    var animatableData: AnimatablePair<AnimatableSize, AnimatableSize> {
        get {
            AnimatablePair(bezelSize, screenSize)
        }
        
        set {
            
            bezelSize = newValue.first
            screenSize = newValue.second
        }
    }
    
    
    var body: some View {
        
        Rectangle()
            .fill(.black)
            .padding()
            .overlay {
                Rectangle()
                    .fill(.green)
//                    .frame(width: screenSize.width, height: screenSize.height)
            }
    }
}

//#Preview {
//    GameboyTransitionView()
//}
