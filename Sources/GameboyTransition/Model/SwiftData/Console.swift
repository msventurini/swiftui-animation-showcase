//
//  ContainerModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//


import SwiftUI
import Observation
import SwiftData

@Model final class Console {
    
    var chronologicalNumber: Int
    
    var containerName: String
    
    var width: Double
    var height: Double
    
    @Relationship(deleteRule: .cascade, inverse: \ConsoleSection.console)
    var sections = [ConsoleSection]()
    
    init(chronologicalNumber: Int,containerName: String, width: Double, height: Double) {
        self.chronologicalNumber = chronologicalNumber
        self.containerName = containerName
        self.width = width
        self.height = height
    }
}
