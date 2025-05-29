//
//  ContainerModel.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//


import SwiftUI
import Observation
import SwiftData

@Model class ConsoleModel {
    
    var containerName: String
    
    var width: Double
    var height: Double
    
    init(containerName: String, width: Double, height: Double) {
        self.containerName = containerName
        self.width = width
        self.height = height
    }
    
}
