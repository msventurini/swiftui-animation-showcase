//
//  ContentContainer.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftUIComponentKit
//import SwiftData

struct ContainerSelectionView: View {

    @Environment(\.containerCollection) private var containerCollection

    @State var selected: Container
    
    var body: some View {
        
        VStack {
            Text(selected.containerName)

            ContainerView(selected: $selected)
            
            ForEach(containerCollection) { consoleItem in
                
                Button {
                    withAnimation {
                        selected = consoleItem
                    }
                    
                } label: {
                    Text(consoleItem.containerName)
                }
                
            }
        }
        //        .task {
        //            withAnimation {
        //
        //                selected = consoles.first!
        //            }
        //        }
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
