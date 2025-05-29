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
        
        NavigationStack {
            
            VStack {
                
                OptionalConsoleSelection(selectedConsole) { model in
                    ContainerView(console: model)
                } onEmptySelection: {
                    
                    Text("a")
                }
            }
            .toolbar {
                ToolbarInlinePicker(selection: $selectedConsole, collection: consoles, showNilAsOption: true) { consoleModel in
                    Text(consoleModel.containerName)
                }
            }
        }
    }
}

#Preview(traits: .modifier(ContainerPreviewData())) {
    ContainerSelectionView()
}




struct ToolbarPickerNavigationView: View {
    var body: some View {
        Text("a")
    }
}
