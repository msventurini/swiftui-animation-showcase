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
    
    init(containerName: String) {
        self.containerName = containerName
    }
    
}
