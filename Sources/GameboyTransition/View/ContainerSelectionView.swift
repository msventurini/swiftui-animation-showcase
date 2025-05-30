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
            
            Rectangle()
                .fill(.pink)
                .overlay {
                    ConsoleFrameLayout(frameWidth: containerCollection.selected.width, frameHeight: containerCollection.selected.height) {
                        ForEach(containerCollection.selected.sections.sorted(by: { $0.drawingOrderNumber < $1.drawingOrderNumber })) { section in
                            
                            Rectangle()
                            
                                .strokeBorder()
                                .containerValue(\.frameWidth, section.width)
                                .containerValue(\.frameHeight, section.heigh)
                                .containerValue(\.frameWidth, section.originX)
                                .containerValue(\.frameHeight, section.originY)
                                .containerValue(\.horizontalSliceProportion, section.horizontalSliceProportion)
                                .containerValue(\.verticalSliceProportion, section.verticalSliceProportion)
                                .containerValue(\.drawingOrder, section.drawingOrderNumber)
                            
                            
                        }
                        
                    }
                }
            
            
            
            HStack {
                ForEach(containerCollection.containers) { container in
                    
                    Button {
                        withAnimation(.bouncy(extraBounce: 0.15)) {
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


#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}



