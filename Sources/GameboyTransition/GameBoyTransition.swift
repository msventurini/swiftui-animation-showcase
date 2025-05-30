//
//  GameBoyTransition.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct GameBoyTransition: View {
    
    @State var containerCollection: ContainerCollection = .init()
    
    var body: some View {
        ContainerSelectionView()
            .environment(containerCollection)
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}
