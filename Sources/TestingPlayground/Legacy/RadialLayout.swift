////
////  RadialLayout.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 25/05/25.
////
//
//
//import SwiftUI
//import Observation
//import AnimationFoundation
//
//struct RadialLayout: Layout, Animatable {
//    
//    var aditionalAngle: Double = .zero
//    var radiusProportion: Double = 1.0
//    
//    var animatableData: AnimatablePair<Double, Double> {
//        get { AnimatablePair(aditionalAngle, radiusProportion) }
//        set {
//            aditionalAngle = newValue.first
//            radiusProportion = newValue.second
//        }
//    }
//    
//    
//    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
//        proposal.replacingUnspecifiedDimensions()
//    }
//    
//    func placeSubviews(
//        in bounds: CGRect,
//        proposal: ProposedViewSize,
//        subviews: Subviews,
//        cache: inout Void
//    ) {
//        
//        
//        let radius = (min(bounds.size.width, bounds.size.height) / 3.0) * radiusProportion
//        
//        
//        let angle = Angle.degrees(360.0 / Double(subviews.count)).radians
//        
//        
//        
//        for (index, subview) in subviews.enumerated() {
//            
//            var point = CGPoint(x: 0, y: -radius)
//                .applying(CGAffineTransform(
//                    rotationAngle: angle * Double(index) + aditionalAngle))
//            
//            // Shift the vector to the middle of the region.
//            point.x += bounds.midX
//            point.y += bounds.midY
//            
//            // Place the subview.
//            subview.place(at: point, anchor: .center, proposal: .unspecified)
//        }
//    }
//    
//}
