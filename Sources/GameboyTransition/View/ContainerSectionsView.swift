//
//  ContainerSectionsView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//


import SwiftUI
import SwiftData

struct ContainerSectionsView: View {
    
    let sectionCollection: [ConsoleSection]
    
    var body: some View {
        
        ForEach(sectionCollection) { consoleSection in
            Rectangle()
                .fill(.secondary)
                .overlay {
                    
                    VStack {
                        Text(consoleSection.sectionID.name)
                        Text(consoleSection.sectionID.id.description)
                    }
                    
                    
                }
        }
        
        
        
        
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}
