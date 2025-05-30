//
//  ContentContainer.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftData
import SwiftUIComponentKit

struct ContainerSelectionView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Container.chronologicalNumber, order: .forward)
    private var consoles: [Container]
        
    var body: some View {

        EmptyToolbarNavigationView(collection: consoles) { console in
            
                ContainerView(console: console)
            
            
        } bottomToolbar: { selectedConsole, collection in
            
            ForEach(collection) { consoleItem in
                
                Button {
//                    selectedConsole = consoleItem
                } label: {
                    Text(consoleItem.containerName)
                }
                
            }
            
//            ToolbarInlinePicker(selected: selectedConsole, collection: consoles) { consoleModel in
//                Text(consoleModel.containerName)
//            }
            
        }
        
        
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}

