//
//  AnimatableShapeModel+Vertex.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 03/06/25.
//

import SwiftUI

extension AnimatableShapeModel {
    
    enum Vertex: Int, Identifiable, Hashable, CaseIterable {
        
        var id: Int {
            return self.rawValue
        }
        
        case topLeading = 0
        case topTrailing = 1
        case bottomTrailing = 2
        case bottomLeading = 3
        
        func getRectHorizontalCoordinates(in rect: CGRect) -> CGFloat {
            switch self {
            case .topLeading, .bottomLeading: rect.minX
            case .topTrailing, .bottomTrailing: rect.maxX
            }
        }
        
        func getRectVerticalCoordinates(in rect: CGRect) -> CGFloat {
            switch self {
            case .topLeading, .topTrailing: rect.minY
            case .bottomLeading, .bottomTrailing: rect.maxY
            }
        }
        
        func getRectCoordinates(in rect: CGRect) -> CGPoint {
            return CGPoint(
                x: getRectHorizontalCoordinates(in: rect),
                y: getRectVerticalCoordinates(in: rect))
        }
        
        
        
        struct Info {
            var coordinates: CGPoint
            var cornerRadius: Double
            var angleValues: AnimatableAngleVariation
        }
        
    }
}
