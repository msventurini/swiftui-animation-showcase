//
//  SectionIdentifier.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//


import SwiftUI
import Observation
import SwiftData

public enum SectionIdentifier: Int, Identifiable, Hashable, Codable {
    
    public var id: Int {
        return rawValue
    }
    
    case consoleScreen = 0
    case controllerRight = 1
    case controllerLeft = 2

}
