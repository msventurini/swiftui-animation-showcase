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
        return proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        
        for (_, subview) in subviews.enumerated() {
            
            guard
                let horizontalDistance = subview.containerValues.centerDistanceX,
                let verticalDistance = subview.containerValues.centerDistanceY
            else {
                print("erro")
                return
            }
            
            subview.place(at: CGPoint(x: bounds.midX + horizontalDistance, y: bounds.midY + verticalDistance), anchor: .center, proposal: .unspecified)

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
