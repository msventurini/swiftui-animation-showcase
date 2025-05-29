//
//  File.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//


import SwiftUI
import Observation
import SwiftData

extension EnvironmentValues {
    @Entry var emptySelectionContents: EmptySelectionContents = .init(
        labelText: "Nothing Here",
        systemImage: "exclamationmark.square",
        description: "Select some option."
    )
}