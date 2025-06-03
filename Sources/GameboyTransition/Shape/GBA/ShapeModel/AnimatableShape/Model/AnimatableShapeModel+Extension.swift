//
//  AnimatableShapeModel+Extension.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI
import AnimationFoundation

extension AnimatableShapeModel {
    
    enum Vertex: Int, Identifiable, Hashable, CaseIterable {
        
        var id: Int {
            return self.rawValue
        }
        
        case topLeading = 0
        case topTrailing = 1
        case bottomTrailing = 2
        case bottomLeading = 3
        
    }
    
    enum HorizontalReferencePoint {
        case minX
        case midX
        case maxX
    }
    
    enum VerticalReferencePoint {
        case minY
        case midY
        case maxY
    }
    
    
    struct VertexData {
        var coordinates: CGPoint
        var cornerRadius: Double
        var angleValues: AnimatableAngleVariation
    }
    
    

    public static let zero: AnimatableShapeModel = .init(
        coordinates: AnimatableShapePropotionalCoordinates.zero,
        cornerRadii: .init(
            topLeading: .zero,
            bottomLeading: .zero,
            bottomTrailing: .zero,
            topTrailing: .zero),
        angleValues: AnimatableShapeAngleValues.zero
    )
    
    func getCoordinatesfor(_ vertex: AnimatableShapeModel.Vertex) -> CGPoint {
        switch vertex {
        case .topLeading: self.coordinates.topLeading
        case .topTrailing: self.coordinates.topTrailing
        case .bottomLeading: self.coordinates.bottomLeading
        case .bottomTrailing: self.coordinates.bottomTrailing
        }
    }
    
    
    func getCornerRadiusFor(_ vertex: AnimatableShapeModel.Vertex) -> CGFloat {
        switch vertex {
        case .topLeading: self.cornerRadii.topLeading
        case .topTrailing: self.cornerRadii.topTrailing
        case .bottomLeading: self.cornerRadii.bottomLeading
        case .bottomTrailing: self.cornerRadii.bottomTrailing
        }
    }
        
        
    func getAngleValuesfor(_ vertex: AnimatableShapeModel.Vertex) -> AnimatableAngleVariation {
        switch vertex {
        case .topLeading: self.angleValues.topLeadingAngleValues
        case .topTrailing: self.angleValues.topTrailingAngleValues
        case .bottomLeading: self.angleValues.bottomTrailingAngleValues
        case .bottomTrailing: self.angleValues.bottomLeadingAngleValues
        }
    }
    
    func getVertexDataFor(_ vertex: AnimatableShapeModel.Vertex) -> VertexData {
        return .init(
            coordinates: self.getCoordinatesfor(vertex),
            cornerRadius: self.getCornerRadiusFor(vertex),
            angleValues: self.getAngleValuesfor(vertex)
        )
    }
    
    func allVertices(in rect: CGRect) -> [VertexData] {
        AnimatableShapeModel.Vertex
            .allCases
            .sorted(by: { $0.id < $1.id })
            .map({ getVertexDataFor($0) })
    }
    
}

#Preview {
    TesteMorphingShape()
}
