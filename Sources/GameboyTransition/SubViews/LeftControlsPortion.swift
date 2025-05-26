//
//  LeftControlsPortion.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation



struct LeftControlsPortion: View {
    var bodyColor: BodyColor
    var actionButtons: [ActionButton]
    
    var body: some View {
        
        RadialLayout {
            ForEach(actionButtons) { actionButton in
//            ForEach(0...numberOfButtons, id: \.self) { index in
                
                //            ForEach
                Circle()
                    .fill(.black)
                    .frame(width: 12, height: 12)
                    .frame(width: 24, height: 24, alignment: .center)
            }
            
        }
    }
}

#Preview {
    GameboyTransitionView()
}
