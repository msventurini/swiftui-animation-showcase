//
//  LeftControlsPortion.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation



struct RightControlsPortion: View {
    
    var bodyColor: BodyColor
    var actionButtons: [ActionButton]
    
    var aditionalAngle: Double = .zero
    var radiusProportion: Double = 1.0
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(aditionalAngle, radiusProportion) }
        set {
            aditionalAngle = newValue.first
            radiusProportion = newValue.second
        }
    }
    
    var body: some View {
        
        RadialLayout(aditionalAngle: aditionalAngle, radiusProportion: radiusProportion) {
            ForEach(actionButtons) { actionButton in
                Circle()
                    .fill(.black)
                    .frame(width: 12, height: 12)
            }
            
        }
    }
}

#Preview {
    
    @Previewable @State var isTapped: Bool = false
    
    VStack {
        RightControlsPortion(bodyColor: .init(red: 0.5, green: 0.1, blue: 0.0), actionButtons: [.aButton, .bButton, .xButton, .yButton], aditionalAngle: isTapped ? .pi : 0, radiusProportion: isTapped ? 1.0 : 0)
        
        Button {
            withAnimation(.smooth) {
                isTapped.toggle()
            }
        } label: {
            Text("aaaa")
        }
            
    }
    
    
}
