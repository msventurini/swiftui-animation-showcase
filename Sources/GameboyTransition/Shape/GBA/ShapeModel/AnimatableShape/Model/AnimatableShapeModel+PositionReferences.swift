//
//  AnimatableShapeModel+PositionReferences.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

extension AnimatableShapeModel {

    struct PositionReferences {
        
        var topPosition: CGFloat
        var bottomPosition: CGFloat
        var trailingPosition: CGFloat
        var leadingPosition: CGFloat
        
        init(
            in rect: CGRect,
            topReference: AnimatableShapeModel.VerticalReferencePoint,
            bottomReference: AnimatableShapeModel.VerticalReferencePoint,
            trailingReference: AnimatableShapeModel.HorizontalReferencePoint,
            leadingReference: AnimatableShapeModel.HorizontalReferencePoint
        ) {
            self.topPosition = PositionReferences.initVerticalPositionFor(topReference, on: rect)
            self.bottomPosition = PositionReferences.initVerticalPositionFor(bottomReference, on: rect)
            self.trailingPosition = PositionReferences.initHorizontalPositionFor(trailingReference, on: rect)
            self.leadingPosition = PositionReferences.initHorizontalPositionFor(leadingReference, on: rect)
        }
        
        func verticalGeometryReferenceFor(_ vertex: Vertex) -> CGFloat {
            switch vertex {
            case .topLeading: self.topPosition
            case .topTrailing: self.topPosition
            case .bottomTrailing: self.bottomPosition
            case .bottomLeading: self.bottomPosition
            }
        }
        
        func horizontalGeometryReferenceFor(_ vertex: Vertex) -> CGFloat {
            switch vertex {
            case .topLeading: self.leadingPosition
            case .topTrailing: self.trailingPosition
            case .bottomTrailing: self.trailingPosition
            case .bottomLeading: self.leadingPosition
            }
        }
        
        private static func initHorizontalPositionFor(_ horizontalReference: AnimatableShapeModel.HorizontalReferencePoint, on rect: CGRect) -> CGFloat {
            switch horizontalReference {
            case .minX:
                rect.minX
            case .midX:
                rect.midX
            case .maxX:
                rect.maxX
            }
        }
        
        private static func initVerticalPositionFor(_ verticalReference: AnimatableShapeModel.VerticalReferencePoint, on rect: CGRect) -> CGFloat {
            switch verticalReference {
            case .minY:
                rect.minY
            case .midY:
                rect.midY
            case .maxY:
                rect.maxY
            }
        }
        
    }
    
}

#Preview {
    TesteMorphingShape()
}
