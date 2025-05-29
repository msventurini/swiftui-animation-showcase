//
//  ContentContainer.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftData

struct ContainerSelectionView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \ConsoleModel.containerName)
    private var consoles: [ConsoleModel]
    
    @State private var selectedConsole: ConsoleModel? = nil
    
    var body: some View {
        
        ToolbarPickerNavigationView(collection: consoles, selected: $selectedConsole) { console in

            ContainerView(console: console)

        } bottomToolbar: { selectedConsole, collection in
            
            ToolbarInlinePicker(selected: $selectedConsole, collection: consoles) { consoleModel in
                Text(consoleModel.containerName)
            }
            
        }

    }
}

#Preview(traits: .modifier(ContainerPreviewData())) {
    ContainerSelectionView()
}
