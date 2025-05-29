//
//  ToolbarInlinePicker.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//


import SwiftUI
import Observation
import SwiftData

struct ToolbarInlinePicker<ItemType, Content>: ToolbarContent where ItemType: Hashable & Identifiable, Content: View {
    
    @Binding var selected: ItemType?
    var collection: [ItemType]
    @ViewBuilder let content: (ItemType) -> Content

    private var showNilAsOption: Bool = true
    
    init(selected: Binding<ItemType?>, collection: [ItemType], content: @escaping (ItemType) -> Content) {
        self._selected = selected
        self.collection = collection
        self.content = content
    }
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            Picker("", selection: $selected) {
                Text("none").tag(nil as ConsoleModel?)
                ForEach(collection) { item in
                    content(item)
                        .tag(item)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}
