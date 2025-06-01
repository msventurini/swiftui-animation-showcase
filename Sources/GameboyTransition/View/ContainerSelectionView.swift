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
    
    @Environment(\.containerCollection) private var containerCollection
    
    @State var selected: Container
    
    var body: some View {
        
        VStack {
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
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    GameBoyTransition()
}
