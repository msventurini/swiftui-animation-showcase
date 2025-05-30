//
//  GameBoyTransition.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct GameBoyTransition: View {

    var body: some View {
        ContainerSelectionWrapper()
            .modelContainer(AppDataUtils.container)
    }
}


struct ContainerSelectionWrapper: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Container.chronologicalNumber, order: .forward)
    private var consoles: [Container]
    
    @State private var selected: Container? = nil
    
    var body: some View {

        ZStack {
            
            if let selected {
                
                ContainerSelectionView(consoles: consoles, selected: selected)
                    .modelContainer(AppDataUtils.container)
            }
            
        }
        .task(priority: .userInitiated) {
            selected = consoles.first!
        }
        
        
        
        
        
    }
}


#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}
