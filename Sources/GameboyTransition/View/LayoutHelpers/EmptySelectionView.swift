//
//  EmptySelectionView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftData

//struct TestView<Content>: View where Content: View {
//    
//    @ViewBuilder let content: () -> Content
//    
//    var body: some View {
//        content("Some text")
//    }
//}

struct EmptySelectionView<Content>: View where Content: View {
    
    @Environment(\.emptySelectionContents) private var emptySelectionContents
        
    @ViewBuilder let content: Content?
    
    var body: some View {
        ContentUnavailableView {
            Label(
                emptySelectionContents.labelText,
                systemImage: emptySelectionContents.systemImage
            )
        } description: {
            Text(emptySelectionContents.description)
        } actions: {
                content


        }
    }
}


#Preview {
    EmptySelectionView {
        Text("a")
    }
}

extension EnvironmentValues {
    @Entry var emptySelectionContents: EmptySelectionContents = .init(
        labelText: "Nothing Here",
        systemImage: "exclamationmark.square",
        description: "Select some option."
    )
}


struct EmptySelectionContents {
    
    let labelText: String
    let systemImage: String
    let description: String
    
}
