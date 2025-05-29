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
                ToolbarInlinePicker(selectedItem: $selectedConsole, itemCollection: consoles, showNilAsOption: true)
            }
        }
    }
}

#Preview(traits: .modifier(ContainerPreviewData())) {
    ContainerSelectionView()
}


struct ToolbarInlinePicker<ItemType>: ToolbarContent where ItemType: Hashable & Identifiable {
    
    @Binding var selectedItem: ItemType?
    var itemCollection: [ItemType]
    var showNilAsOption: Bool
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            Picker("Console Selection", selection: $selectedItem) {
                Text("none").tag(nil as ConsoleModel?)
                ForEach(itemCollection) { item in
                    Text("a")
                        .tag(item)
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
