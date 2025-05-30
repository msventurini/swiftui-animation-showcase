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
        

        ToolbarPickerNavigationView(collection: containerCollection.containers) { console in
            
                ContainerView(console: console)
            
            
        } bottomToolbar: { selectedConsole, collection in
            
            ToolbarInlinePicker(selected: selectedConsole, collection: collection) { consoleModel in
                Text(consoleModel.containerName)
            }
            
        }
        
        
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerSelectionView()
}

