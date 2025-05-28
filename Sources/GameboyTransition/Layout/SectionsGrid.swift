//
//  SectionsGrid.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 27/05/25.
//


import SwiftUI

struct SectionsGrid: Layout {
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
        return proposal.replacingUnspecifiedDimensions()
        
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
//        let console: HandheldConsoleContainer
//        let consoleSection: ConsoleSection
//        let sliceOriginPosition: CGRectEdge
//        let sizeProportion: Double
        
        let containerSize: CGSize = bounds.size
//        let (slice, remainder) = bounds.divided(atDistance: bounds.height * 0.5, from: .minYEdge)
        
        var currentSlice = bounds
        
        for (_, subview) in subviews.enumerated() {
            
            if
                let sliceOrigin = subview
                    .containerValues
                    .rectSliceStartingPosition,
                let sliceSizeProportion = subview
                    .containerValues
                    .rectSliceProportion
            {
                
                
                
                subview.place(at: bounds.origin, anchor: .zero, proposal: .init(width: 2, height: 2))
                
                
                
                
            } else {
                subview.place(at: bounds.origin, anchor: .zero, proposal: .init(width: 2, height: 2))

            }
            
            
//            let (newSlice, remainder) = currentSlice
//                .divided(atDistance: <#T##CGFloat#>, from: <#T##CGRectEdge#>)
            
            
//            subview.place(at: slice.origin, anchor: .zero, proposal: .init(width: slice.width, height: slice.height))
//            subview.place(at: bounds.origin, anchor: .zero, proposal: .init(width: 2, height: 2))

            
            
            
        }
    }
}

#Preview {
    PreviewView()
}
