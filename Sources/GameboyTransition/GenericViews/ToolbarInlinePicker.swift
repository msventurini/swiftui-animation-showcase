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
    
    @Binding var selection: ItemType?
    var collection: [ItemType]
    var showNilAsOption: Bool
    @ViewBuilder let content: (ItemType) -> Content

    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            Picker("", selection: $selection) {
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