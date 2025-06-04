//
//  AnimatableShapeModel+Extension.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 02/06/25.
//

import SwiftUI

extension AnimatableShapeModel {
    
    func getOffsetCoordinatesFor(_ vertex: AnimatableShapeModel.Vertex) -> CGPoint {
        
        switch vertex {
        case .topLeading: self.coordinates.topLeading
        case .topTrailing: self.coordinates.topTrailing
        case .bottomTrailing: self.coordinates.bottomTrailing
        case .bottomLeading: self.coordinates.bottomLeading
        }
    }
    
    func getCoordinatesfor(_ vertex: AnimatableShapeModel.Vertex, in rect: CGRect) -> CGPoint {

        let offsetCoordinates = getOffsetCoordinatesFor(vertex)
        let rectCoordinates = vertex.getRectCoordinates(in: rect)
        
        return .init(
            x: rectCoordinates.x + offsetCoordinates.x,
            y: rectCoordinates.y + offsetCoordinates.y
        )
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
        case .bottomLeading: self.angleValues.bottomLeadingAngleValues
        case .bottomTrailing: self.angleValues.bottomTrailingAngleValues
        }
    }
    
    func getVertexDataFor(_ vertex: AnimatableShapeModel.Vertex, in rect: CGRect) -> Vertex.Info {
        return .init(
            coordinates: self.getCoordinatesfor(vertex, in: rect),
            cornerRadius: self.getCornerRadiusFor(vertex),
            angleValues: self.getAngleValuesfor(vertex)
        )
    }
    
    func allVertices(in rect: CGRect) -> [Vertex.Info] {
        AnimatableShapeModel.Vertex
            .allCases
            .sorted(by: { $0.id < $1.id })
            .map({ getVertexDataFor($0, in: rect) })
    }
    
}

#Preview {
    TesteNewMorphingShape()
}
