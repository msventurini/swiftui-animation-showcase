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
//    @Environment(ContainerCollection.self) private var containerCollection: ContainerCollection
//
    
//        @State var containerCollection: ContainerCollection = .init()
    
    var body: some View {

        VStack {
            
            Rectangle()
                .fill(.pink)
                .overlay {
                    ConsoleFrameLayout {
//                        ForEach(containerCollection.selected.sections.sorted(by: { $0.drawingOrderNumber < $1.drawingOrderNumber })) { section in
//                            
                            Rectangle()
                                    .strokeBorder()
//                                    .containerValue(\.frameWidth, section.width)
//                                    .containerValue(\.frameHeight, section.heigh)
//                                    .containerValue(\.frameWidth, section.originX)
//                                    .containerValue(\.frameHeight, section.originY)
//                                    .containerValue(\.horizontalSliceProportion, section.horizontalSliceProportion)
//                                    .containerValue(\.verticalSliceProportion, section.verticalSliceProportion)
//                                    .containerValue(\.drawingOrder, section.drawingOrderNumber)
//                                    .frame(width: section.width, height: section.heigh)
//                            }
//                                    .tag(section.drawingOrderNumber)
                            
                            
//                        }
                        
                    }
                }
            
//            
//            
//            HStack {
//                ForEach(containerCollection.containers) { container in
//                    
//                    Button {
//                        withAnimation(.bouncy(extraBounce: 0.15)) {
//                            containerCollection.selected = container
//                        }
//                        
//                    } label: {
//                        Text(container.containerName)
//                    }
//                    .buttonStyle(.bordered)
//                }
//            }
        }
    }
}


//#Preview(traits: .modifier(ContainerPreviewModifier())) {
#Preview {
    ContainerSelectionView()
}



