//
//  OptionalConsoleSelection.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//


import SwiftUI
import Observation
import SwiftData


struct OptionalItemSelection<Content, EmptyContent, ItemType>: View where Content: View, EmptyContent: View, ItemType: Hashable & Identifiable {

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
