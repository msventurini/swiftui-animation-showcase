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
        
//        let fullSize: CGSize
//        let filledLinesSize: CGSize
//        let currentLineFilledSize
//        
        return proposal.replacingUnspecifiedDimensions()
//        return .init(width: 148, height: 90)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
                
        var offset = CGSize(width: 0, height: 0)
        
        for (index, subview) in subviews.enumerated() {
//            
//            let horizontalSliceProportion = subview.containerValues.horizontalSliceProportion
//            let horizontalSliceOrigin: CGRectEdge = .minXEdge
//            let horizontalSliceSize = horizontalSliceProportion * bounds.width
//            
//            let verticalOrigin: CGRectEdge = .minYEdge
//            let verticalSliceProportion = subview.containerValues.verticalSliceProportion
//            let verticalSliceSize = verticalSliceProportion * bounds.height
//            
//            if horizontalSliceProportion > 0 {
//                let (slice, remainder) = currentSlice.divided(atDistance: horizontalSliceSize, from: horizontalSliceOrigin)
//                
//                currentSlice = remainder
//                
//                subview.place(at: slice.origin, anchor: .zero, proposal: .init(width: slice.width, height: slice.height))
//            }
//            
//            if verticalSliceProportion > 0 {
//                let (slice, remainder) = currentSlice.divided(atDistance: verticalSliceSize, from: verticalOrigin)
//                
//                currentSlice = remainder
//                
            subview.place(at: CGPoint(x: bounds.midX, y: bounds.midY), anchor: .center, proposal: .unspecified)
//            }
        }
        
        
        
    }
    
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}

//
//guard
//    let subviewWidth = subview.containerValues.frameWidth,
//    let subviewHeight = subview.containerValues.frameHeight,
//    let itemPositionX = subview.containerValues.frameWidth,
//    let itemPositionY = subview.containerValues.frameHeight
////                let widthRatioToContainer = subview.containerValues.horizontalProportionToContainer,
////                let heightRatioToContainer = subview.containerValues.verticalProportionToContainer
//
//else {
//    print("deu ruim")
//    return
//}
//
////            let newRect = CGRect().intersection(<#T##r2: CGRect##CGRect#>)
//
//
//let itemPosition = CGPoint(
//    x: (bounds.origin.x + (itemPositionX *  subviewWidth) + offset.width),
//    y: (bounds.origin.y - (itemPositionY * subviewHeight)) + offset.height)
//
//
//offset = CGSize(width: offset.width + subviewWidth, height: subviewHeight)
//
//
//
////            print("bounds: \(bounds.size)")
//
//
////            let relativeOriginX = subview.containerValues.relativeOriginX ?? .zero
////            let relativeOriginY = subview.containerValues.relativeOriginY ?? .zero
////
////            let originX = bounds.origin.x// + (relativeOriginX * 0.5)
////            let originY = bounds.size.height * relativeOriginY
//
////            subview.place(at: bounds.origin, anchor: .zero, proposal: .unspecified)
//subview.place(at: itemPosition, anchor: .zero, proposal: .init(width: subviewWidth, height: subviewHeight))
