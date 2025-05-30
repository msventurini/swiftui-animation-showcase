//
//  ConsoleFrameLayout.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//


import SwiftUI
import Observation
import SwiftData
import SwiftUIComponentKit



struct ConsoleFrameLayout: Layout {
    
    @Binding var frameWidth: Double
    @Binding var frameHeight: Double
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        
        let width = frameWidth
        let height = frameHeight

        return .init(width: width, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        print(proposal)
        print(bounds)
        
        var currentSlice = bounds

        for (_, subview) in subviews.enumerated() {
            print("chamou")
            print(subview.containerValues.sectionIdentifier)
            let sliceOrigin = subview.containerValues.rectSliceStartingPosition
            let sliceSizeProportion = subview.containerValues.rectSliceProportion
            let sliceOrientation = subview.containerValues.sliceOrientation
            
            
            let sliceSize = (sliceOrientation == .horizontal) ? bounds.width * sliceSizeProportion : bounds.height * sliceSizeProportion
            
            let (slice, remainder) = currentSlice.divided(atDistance: sliceSize, from: sliceOrigin)
            
            currentSlice = remainder
            
            subview.place(at: slice.origin, anchor: .zero, proposal: .init(width: slice.width, height: slice.height))
            
        }
        
        
    }
    
}


#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}
