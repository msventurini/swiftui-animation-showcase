//
//  ContainerModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//


import SwiftUI
import Observation
//import SwiftData

@Observable public final class Container: Identifiable, Equatable, Hashable {
    
    public static func == (lhs: Container, rhs: Container) -> Bool {
        lhs.containerID == rhs.containerID
    }
    
    
    public var containerID: ContainerID
    public var chronologicalNumber: Int
    public var containerName: String
    public var width: Double
    public var height: Double
    
//    @Relationship(deleteRule: .cascade, inverse: \ConsoleSection.console)
    public var sections: [ConsoleSection] = []
    
    public init(containerID: ContainerID, chronologicalNumber: Int,containerName: String, width: Double, height: Double) {
        self.containerID = containerID
        self.chronologicalNumber = chronologicalNumber
        self.containerName = containerName
        self.width = width
        self.height = height
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
