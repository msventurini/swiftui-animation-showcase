//
//  CodableRectEdge.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//

import Foundation

public enum CodableRectEdge: Sendable, Codable {
    
    case maxX
    case maxY
    case minX
    case minY
    
    
    public var asCGRectEdge: CGRectEdge {
        switch self {
        case .maxX:
                .maxXEdge
        case .maxY:
                .maxYEdge
        case .minX:
                .minXEdge
        case .minY:
                .minYEdge
        }
    }
}
