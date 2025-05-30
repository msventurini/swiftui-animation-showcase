//
//  ContentContainer.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftUIComponentKit

struct ContainerSelectionView: View {
    @Environment(ContainerCollection.self) private var containerCollection: ContainerCollection
    
    
    
    var body: some View {
        @Bindable var containerCollection = self.containerCollection
        VStack {
            ConsoleFrameLayout(frameWidth: $containerCollection.selected.width, frameHeight: $containerCollection.selected.height) {
                
                ForEach(containerCollection.selected.sections) { consoleSection in
                    
                    ContainerSectionView(consoleSection: consoleSection)
                    
                }
            }
            
            HStack {
                ForEach(containerCollection.containers) { container in
                    
                    Button {
                        withAnimation(.bouncy) {
                            containerCollection.selected = container
                        }
                        
                    } label: {
                        Text(container.containerName)
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
    }
}

//@Observable class ConsoleLayoutSectionValues {
//    var sliceProportion
//    var sliceOriginPosition
//}

struct ContainerSectionView: View, Animatable {
    
    var consoleSection: ConsoleSection
    
    var body: some View {
        Rectangle()
            .fill(consoleSection.animatableColor.asSwiftUIColor())
            .strokeBorder()
            .containerValue(\.sliceOrientation, consoleSection.sliceOrientation)
            .containerValue(\.rectSliceProportion, consoleSection.sizeProportion)
            .containerValue(\.rectSliceStartingPosition, consoleSection.sliceOriginPosition)
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}

