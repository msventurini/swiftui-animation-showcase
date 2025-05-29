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
                OptionalItemSelection(selectedConsole) { model in
                    ContainerView(console: model)
                }
            }
            .toolbar {
                ToolbarInlinePicker(selected: $selectedConsole, collection: consoles) { consoleModel in
                    Text(consoleModel.containerName)
                }
            }
        }
    }
}

#Preview(traits: .modifier(ContainerPreviewData())) {
    ContainerSelectionView()
}


struct ToolbarPickerNavigationView<Content, BottomToolbar, ItemType>: View where Content: View, BottomToolbar: ToolbarContent, ItemType: Hashable & Identifiable {
    
    @Binding var selected: ItemType?
    var collection: [ItemType]
    let content: (ItemType) -> Content
    let bottomToolbar: () -> BottomToolbar

    init(
        collection: [ItemType],
        selected: Binding<ItemType?>,
        @ViewBuilder content: @escaping (ItemType) -> Content,
        @ViewBuilder bottomToolbar: @escaping () -> BottomToolbar
    ) {
        self.collection = collection
        self._selected = selected
        self.content = content
        self.bottomToolbar = bottomToolbar
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
            }
            .toolbar {
                
            }
        }
        
    }
}

struct OptionalItemSelection4<Content, EmptyContent, ItemType>: View where Content: View, EmptyContent: View, ItemType: Hashable & Identifiable {

    var selected: ItemType?
    var content: (ItemType) -> Content?
    var emptySelectionContent: EmptyContent
    
    
    @ViewBuilder var conditionalContent: some View {
        if let selected {
            content(selected)
        } else {
            emptySelectionContent
        }
    }
    
    init(_ selected: ItemType?, @ViewBuilder content: @escaping (ItemType) -> Content, @ViewBuilder onEmptySelection emptySelectionContent: () -> EmptyContent = { EmptySelectionView() }) {
        self.selected = selected
        self.content = content
        self.emptySelectionContent = emptySelectionContent()
    }

    var body: some View {
        conditionalContent
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}




struct EmptySelection3View<Content>: View where Content: View {
    
    @Environment(\.emptySelectionContents) private var emptySelectionContents
        
    let action: () -> Content

    
    
    init(@ViewBuilder action: @escaping () -> Content = { EmptyView() }) {
        self.action = action
    }
    
    var body: some View {
        ContentUnavailableView {
            Label(
                emptySelectionContents.labelText,
                systemImage: emptySelectionContents.systemImage
            )
        } description: {
            Text(emptySelectionContents.description)
        } actions: {
            action()
        }
    }
}
