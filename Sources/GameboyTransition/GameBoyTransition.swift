//
//  GameBoyTransition.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation

struct GameBoyTransition: View {
    
    @Environment(\.containerCollection) private var containerCollection
    
    init() {
        
    }
    
    var body: some View {
        ContainerSelectionView(selected: containerCollection[1])
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}
