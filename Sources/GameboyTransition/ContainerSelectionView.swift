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
                    
                    
                }
            }
            .toolbar {
                ToolbarInlinePicker(selectedConsole: $selectedConsole, consoles: consoles, showNilAsOption: true)
            }
        }
    }
}

#Preview(traits: .modifier(ContainerPreviewData())) {
    ContainerSelectionView()
}


struct ToolbarInlinePicker: ToolbarContent {
    
    @Binding var selectedConsole: ConsoleModel?
    var consoles: [ConsoleModel]
    var showNilAsOption: Bool
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            Picker("Console Selection", selection: $selectedConsole) {
                Text("none").tag(nil as ConsoleModel?)
                ForEach(consoles) { console in
                    Text(console.containerName)
                        .tag(console)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct ToolbarPickerNavigationView: View {
    var body: some View {
        Text("a")
    }
}
