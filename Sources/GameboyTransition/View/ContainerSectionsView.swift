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
        
        IrregularGrid {
            ForEach(sectionCollection) { consoleSection in
                Rectangle()
                    .fill(consoleSection.color)
                    .containerValue(\.rectSliceProportion, consoleSection.sizeProportion)
                    .containerValue(\.rectSliceStartingPosition, consoleSection.sliceOriginPosition)
                
            }
        }
                
        
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}
