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
                    .fill(consoleSection.color)
            }
        

    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}
