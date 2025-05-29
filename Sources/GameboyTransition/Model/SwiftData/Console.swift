//
//  ContainerModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//


import SwiftUI
import Observation
import SwiftData

@Model public final class Console {
    
    public var chronologicalNumber: Int
    public var containerName: String
    public var width: Double
    public var height: Double
    
    @Relationship(deleteRule: .cascade, inverse: \ConsoleSection.console)
    public var sections = [ConsoleSection]()
    
    public init(chronologicalNumber: Int,containerName: String, width: Double, height: Double) {
        self.chronologicalNumber = chronologicalNumber
        self.containerName = containerName
        self.width = width
        self.height = height
    }
}
