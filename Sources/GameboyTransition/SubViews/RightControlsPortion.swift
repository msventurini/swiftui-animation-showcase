//
//  RightControlsPortion.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation

struct RightControlsPortion: View {
    
    var bodyColor: BodyColor
    
    
    var body: some View {
        
        Rectangle()
            .fill(bodyColor.asSwiftUIColor())
            .overlay {
                ZStack {
                    Rectangle()
                        .fill(.black)
                        .frame(width: 10, height: 24)
                    Rectangle()
                        .fill(.black)
                        .frame(width: 24, height: 10)
                }
            }
        
    }
}

#Preview {
    GameboyTransitionView()
}
