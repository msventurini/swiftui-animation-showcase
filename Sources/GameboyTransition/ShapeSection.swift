//
//  ShapeSection.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//


import SwiftUI

public enum ShapeSection: Int, Identifiable, CaseIterable, Hashable, Sendable {
    
    public var id: Int {
        return rawValue
    }
    
    case leftScreen = 0
    case rightScreen
    case leftController
    case rightController
    
}
