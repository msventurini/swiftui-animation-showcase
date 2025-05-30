//
//  ContainerView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct ContainerView: View {
    
    let console: Container
    
    var body: some View {
        ConsoleFrameLayout {
            ContainerSectionsView(sectionCollection: console.sections)
                .containerValue(\.frameWidth, console.width)
                .containerValue(\.frameHeight, console.height)
        }
        .overlay(alignment: .bottomTrailing) {
            Text(console.sections.count.description)
            Text(console.containerName)
                .padding()
        }
    }
}


#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}
