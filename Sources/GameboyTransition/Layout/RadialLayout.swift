//
//  RadialLayout.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation

struct RadialLayout: Layout, Animatable {
    
    var aditionalAngle: Angle = .zero
    
    var animatableData: Angle {
        get { aditionalAngle }
        set { aditionalAngle = newValue }
    }
    
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) {
        // Place the views within the bounds.
        let radius = min(bounds.size.width, bounds.size.height) / 3.0
        
        // The angle between views depends on the number of views.
        let angle = Angle.degrees(360.0 / Double(subviews.count)).radians
        
        
        
        for (index, subview) in subviews.enumerated() {
            // Find a vector with an appropriate size and rotation.
            var point = CGPoint(x: 0, y: -radius)
                .applying(CGAffineTransform(
                    rotationAngle: angle * Double(index) + aditionalAngle.radians))
            
            // Shift the vector to the middle of the region.
            point.x += bounds.midX
            point.y += bounds.midY
            
            // Place the subview.
            subview.place(at: point, anchor: .center, proposal: .unspecified)
        }
    }
    
}