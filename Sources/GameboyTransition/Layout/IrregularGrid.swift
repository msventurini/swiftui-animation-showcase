//
//  SectionsGrid.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 27/05/25.
//

import SwiftUI

//struct IrregularGrid: Layout {
//    
//    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
//        
//        return proposal.replacingUnspecifiedDimensions()
//        
//    }
//    
//    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
//                
//        var currentSlice = bounds
//        
//        for (_, subview) in subviews.enumerated() {
//            print(subview.containerValues.sectionIdentifier)
//            let sliceOrigin = subview.containerValues.rectSliceStartingPosition
//            let sliceSizeProportion = subview.containerValues.rectSliceProportion
//            let sliceOrientation = subview.containerValues.sliceOrientation
//            
//            
//            let sliceSize = (sliceOrientation == .horizontal) ? bounds.width * sliceSizeProportion : bounds.height * sliceSizeProportion
//            
//            let (slice, remainder) = currentSlice.divided(atDistance: sliceSize, from: sliceOrigin)
//            
//            currentSlice = remainder
//            
//            subview.place(at: slice.origin, anchor: .zero, proposal: .init(width: slice.width, height: slice.height))
//            
//        }
//    }
//}
