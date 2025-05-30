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
        
        VStack {
            ConsoleFrameLayout {
                 ForEach(selected.sections) { section in
                        Rectangle()
                            .strokeBorder(lineWidth: 4)
                            .overlay {
                                Text(section.id.description)
                            }
                         .containerValue(\.frameWidth, section.containerWidth)
                         .containerValue(\.frameHeight, section.containerHeight)

                         .containerValue(\.centerDistanceX, section.centerDistanceX)
                         .containerValue(\.centerDistanceY, section.centerDistanceY)
                            .frame(width: section.width, height: section.height)
        
                }
            }
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
            withAnimation {
                
                selected = consoles.first!
            }
        }
            
            
        
    }
}


//#Preview(traits: .modifier(ContainerPreviewModifier())) {
#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}

