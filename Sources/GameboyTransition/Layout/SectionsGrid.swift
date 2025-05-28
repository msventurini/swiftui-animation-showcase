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
        
        let containerSize: CGSize = bounds.size
        let (slice, remainder) = bounds.divided(atDistance: bounds.height * 0.5, from: .minYEdge)
        
        for (_, subview) in subviews.enumerated() {
            
            subview.place(at: slice.origin, anchor: .zero, proposal: .init(width: slice.width, height: slice.height))
            
        }
    }
}