//
//  ContentContainer.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftUIComponentKit
import SwiftData





struct ContainerSectionsView<Content: View>: View {
    var content: Content


    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }


    var body: some View {
        ConsoleFrameLayout {
            Group(subviews: content) { subviews in
                ForEach(subviews: subviews) { subview in
                    subview
//                        .strokeBorder()
                        //                            .containerValue(\.relativeOriginX, section.originX)
                        //                            .containerValue(\.relativeOriginY, section.originY)
                        //                            .containerValue(\.drawingOrder, section.drawingOrderNumber)
                        //                            .frame(width: section.width, height: section.height)
                        
                }
            }
        }
    }
}

struct ContainerSelectionView: View {
    @Environment(\.modelContext) var modelContext
    
    var consoles: [Container]
    
    @State var selected: Container
    
    var body: some View {
        //a
        
        
        VStack {
            ContainerSectionsView {
                 ForEach(selected.sections) { section in
                        Rectangle()
                            .strokeBorder(lineWidth: 4)
                            .containerValue(\.relativeOriginX, section.originX)
                            .containerValue(\.relativeOriginY, section.originY)
                            .containerValue(\.drawingOrder, section.drawingOrderNumber)
                         .containerValue(\.frameWidth, section.containerWidth)
                         .containerValue(\.frameHeight, section.containerHeight)
                         .containerValue(\.horizontalProportionToContainer, section.widthRatioToContainer)
                         .containerValue(\.verticalProportionToContainer, section.heightRatioToContainer)
                     
                            .frame(width: section.width, height: section.height)
                       
                     
                     
                }
            }
//            .frame(width: selected.width, height: selected.height)
//            .background(.red)
            
            
            
            ForEach(consoles) { consoleItem in
                
                Button {
                    withAnimation {
                        selected = consoleItem
                    }
                    
                } label: {
                    Text(consoleItem.containerName)
                }
                
            }
        }
        .task {
            selected = consoles.first!
        }
            
            
        
    }
}


//#Preview(traits: .modifier(ContainerPreviewModifier())) {
#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}

