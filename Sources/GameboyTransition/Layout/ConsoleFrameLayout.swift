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

    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
//        let width = frameWidth
//        let height = frameHeight
//        
//        return .init(width: width, height: height)
        return proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        var currentSlice = bounds
        
        for (index, subview) in subviews.enumerated() {
            
            let horizontalSliceProportion = subview.containerValues.horizontalSliceProportion
            let horizontalSliceOrigin: CGRectEdge = .minXEdge
            let horizontalSliceSize = horizontalSliceProportion * bounds.width
            
            let verticalOrigin: CGRectEdge = .minYEdge
            let verticalSliceProportion = subview.containerValues.verticalSliceProportion
            let verticalSliceSize = verticalSliceProportion * bounds.height
            
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
