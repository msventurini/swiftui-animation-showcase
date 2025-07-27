//
//  GameBoyTransition.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation

struct GameBoyTransition: View {
    
    @Environment(\.sectionedShapeCollection) private var shapeCollection
    @Environment(\.selectedShape) private var selectedShape
    
    init() {
        
    }
    
    var body: some View {
        ContainerSelectionView(selected: selectedShape)
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}
