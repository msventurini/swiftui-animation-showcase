//
//  OptionalConsoleSelection.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//


import SwiftUI
import Observation
import SwiftData

struct OptionalConsoleSelection<Content: View, EmptyContent: View>: View {

    var selectedConsole: ConsoleModel?
    var content: (ConsoleModel) -> Content?
    var emptySelectionContent: EmptyContent
    
    
    @ViewBuilder var conditionalContent: some View {
        if let selectedConsole {
            content(selectedConsole)
        } else {
            emptySelectionContent
        }
    }
    
    init(_ selectedConsole: ConsoleModel?, @ViewBuilder content: @escaping (ConsoleModel) -> Content, @ViewBuilder onEmptySelection emptySelectionContent: () -> EmptyContent) {
        self.selectedConsole = selectedConsole
        self.content = content
        self.emptySelectionContent = emptySelectionContent()
    }

    var body: some View {
        conditionalContent
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
