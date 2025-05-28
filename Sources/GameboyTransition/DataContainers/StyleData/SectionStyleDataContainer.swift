//
//  SectionStyleData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//


import SwiftUI
import Observation
import AnimationFoundation

struct SectionStyleDataContainer: Sendable, Equatable {
    
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
}
