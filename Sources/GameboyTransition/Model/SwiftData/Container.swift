//
//  ContainerModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//


import SwiftUI
import Observation

public struct ShapeLayoutDataLegacy: Identifiable, Equatable, Hashable, Sendable {
    
    public var id: Int {
        return containerID.id
    }
    
    public static func == (lhs: ShapeLayoutDataLegacy, rhs: ShapeLayoutDataLegacy) -> Bool {
        lhs.containerID == rhs.containerID
    }
    
    public var containerID: ContainerID
    public var chronologicalNumber: Int
    public var containerName: String
    public var width: Double
    public var height: Double
    
    public var sections: [ConsoleSectionLayoutData] = []
    
    public init(containerID: ContainerID, chronologicalNumber: Int,containerName: String, width: Double, height: Double) {
        self.containerID = containerID
        self.chronologicalNumber = chronologicalNumber
        self.containerName = containerName
        self.width = width
        self.height = height
    }

}
