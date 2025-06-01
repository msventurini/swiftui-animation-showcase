//
//  SectionView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI
import Observation

struct SectionView: View {
    
    var section: ConsoleSection
    var centerDistanceX: Double
    var centerDistanceY: Double
    
    init(section: ConsoleSection) {
        self.section = section
        self.centerDistanceX = section.centerDistanceX
        self.centerDistanceY = section.centerDistanceY
    }
    
    var body: some View {
        Rectangle()
            .strokeBorder(lineWidth: 4)
            .overlay {
                Text(section.id.description)
            }
            .frame(width: section.width, height: section.height)
            .frame(height: 200)
            
    }
    
}