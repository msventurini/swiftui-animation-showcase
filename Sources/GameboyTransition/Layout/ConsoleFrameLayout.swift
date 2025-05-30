////
////  ConsoleFrameLayout.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 29/05/25.
////


import SwiftUI
import Observation
import SwiftData
import SwiftUIComponentKit

struct ConsoleFrameLayout: Layout {
    
    
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(frameWidth, frameHeight)
        }
        
        set {
            frameWidth = newValue.first
            frameHeight = newValue.second
            
        }
    }
    
    var frameWidth: Double
    var frameHeight: Double
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
        let width = frameWidth
        let height = frameHeight
        
        return .init(width: width, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var currentRect = CGRect(x: bounds.midX - (frameWidth * 0.5), y: bounds.midY - (frameHeight * 0.5), width: frameWidth, height: frameHeight)
        
        var currentSlice = currentRect
        
        for (index, subview) in subviews.enumerated() {
            
            let horizontalSliceProportion = subview.containerValues.horizontalSliceProportion
            let horizontalSliceOrigin: CGRectEdge = .minXEdge
            let horizontalSliceSize = horizontalSliceProportion * frameWidth
            
            let verticalOrigin: CGRectEdge = .minYEdge
            let verticalSliceProportion = subview.containerValues.verticalSliceProportion
            let verticalSliceSize = verticalSliceProportion * frameHeight
            
            if horizontalSliceProportion > 0 {
                let (slice, remainder) = currentSlice.divided(atDistance: horizontalSliceSize, from: horizontalSliceOrigin)
                
                currentSlice = remainder
                
                subview.place(at: slice.origin, anchor: .zero, proposal: .init(width: slice.width, height: slice.height))
            }
            
            if verticalSliceProportion > 0 {
                let (slice, remainder) = currentSlice.divided(atDistance: verticalSliceSize, from: verticalOrigin)
                
                currentSlice = remainder
                
                subview.place(at: slice.origin, anchor: .zero, proposal: .init(width: slice.width, height: slice.height))
            }
        }
        
        
        
    }
    
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}
