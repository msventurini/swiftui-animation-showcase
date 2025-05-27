//
//  ConsoleLayout.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation





//struct ConsoleLayout: Layout, Animatable {
//    
//    var handheldLayout: HandheldLayout
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
//        for (index, subview) in subviews.enumerated() {
//            
//            var size: CGSize = .zero
//            var point: CGPoint = .zero
//            
//            if handheldLayout == .vertical && subview.containerValues.handheldLayout == .vertical {
//                
//                if subview.containerValues.consoleSection == .consoleScreen {
//                    size = .init(width: bounds.width, height: bounds.height * 0.5)
//                    point = bounds.origin
//                    
//                } else if subview.containerValues.consoleSection == .controllerLeft {
//                    size = .init(width: bounds.width * 0.5, height: bounds.height * 0.5)
//                    point = .init(x: bounds.minX, y: bounds.midY)
//
//                } else if subview.containerValues.consoleSection == .controllerRight {
//                    size = .init(width: bounds.width * 0.5, height: bounds.height * 0.5)
//                    point = .init(x: bounds.midX, y: bounds.midY)
//                    
//                }
//                
//            } else if handheldLayout == .horizontal && subview.containerValues.handheldLayout == .horizontal {
//                
//                
//                if subview.containerValues.consoleSection == .controllerLeft {
//                    size = .init(width: bounds.width * 0.2, height: bounds.height)
//                    point = bounds.origin
//
//                } else if subview.containerValues.consoleSection == .consoleScreen {
//                    size = .init(width: bounds.width * 0.60, height: bounds.height)
//                    point = .init(x: bounds.minX + bounds.width * 0.2, y: bounds.minY)
//                    
//                } else if subview.containerValues.consoleSection == .controllerRight {
//                    size = .init(width: bounds.width * 0.20, height: bounds.height)
//                    point = .init(x: bounds.minX + bounds.width * 0.8, y: bounds.minY)
//                    
//                }
//                
//            }
//            
//            subview.place(at: point, anchor: .topLeading, proposal: .init(size))
//        }
//    }
//    
//}

//#Preview {
//    GameboyTransitionView()
//}
