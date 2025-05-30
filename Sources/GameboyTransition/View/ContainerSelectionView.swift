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

struct ContainerSelectionView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Container.chronologicalNumber, order: .forward)

    var consoles: [Container]
        
    @State private var selected: Container? = nil
        
    var body: some View {
        
        VStack {
            
            if let selected {
            
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


#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}


//struct ContainerSectionsView<Content: View>: View {
//    var content: Content
//
//    init(@ViewBuilder content: () -> Content) {
//        self.content = content()
//    }
//
//    var body: some View {
//        ConsoleFrameLayout {
//            Group(subviews: content) { subviews in
//                ForEach(subviews: subviews) { subview in
//                    subview
//                }
//            }
//        }
//    }
//}
