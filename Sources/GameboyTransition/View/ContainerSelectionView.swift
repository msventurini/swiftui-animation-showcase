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
    @Query(sort: \ConsoleModel.containerName)
    private var consoles: [ConsoleModel]
    
    @State private var selectedConsole: ConsoleModel? = nil
    
    var body: some View {
        
        ToolbarPickerNavigationView(collection: consoles, selected: $selectedConsole) { console in
            
            
            
            ContainerView(console: console)
                .containerValue(\.frameWidth, console.width)
                .containerValue(\.frameHeight, console.height)
            
            
            
        } bottomToolbar: { selectedConsole, collection in
            
            ToolbarInlinePicker(selected: $selectedConsole, collection: consoles) { consoleModel in
                Text(consoleModel.containerName)
            }
            
        }
        .task {
          
            selectedConsole = consoles.first
        }
        
    }
}

#Preview(traits: .modifier(ContainerPreviewData())) {
    ContainerSelectionView()
}

