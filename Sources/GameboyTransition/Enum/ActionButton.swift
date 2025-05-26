//
//  ActionButton.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 25/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation

enum ActionButton: String, CustomStringConvertible, Identifiable, CaseIterable, Hashable, Equatable {
    
    var id: String {
        return self.description
    }
    
    case aButton = "a"
    case bButton = "b"
    case xButton = "x"
    case yButton = "y"
    
    var description: String {
        return self.rawValue
    }
    
}
