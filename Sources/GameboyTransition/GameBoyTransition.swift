//
//  GameBoyTransition.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct GameBoyTransition: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Container.chronologicalNumber, order: .forward)

    var consoles: [Container]
        
    @State private var selected: Container? = nil

    var body: some View {
        ContainerSelectionView()
            .modelContainer(AppDataUtils.container)
        
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}
