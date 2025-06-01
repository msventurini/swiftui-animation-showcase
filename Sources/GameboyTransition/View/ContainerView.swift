//
//  ContainerView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 30/05/25.
//

import SwiftUI
import Observation

struct ContainerView: View {

    @Binding var selected: Container
        
    var body: some View {

            ConsoleFrameLayout {
                ForEach(selected.sections) { section in
                   SectionView(section: section)
                        .containerValue(\.centerDistanceX, section.centerDistanceX)
                        .containerValue(\.centerDistanceY, section.centerDistanceY)

                }
            }
    }
}

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
            
    }
    
}



#Preview(traits: .modifier(ContainerPreviewModifier())) {
//    ContainerView()
    GameBoyTransition()
}
