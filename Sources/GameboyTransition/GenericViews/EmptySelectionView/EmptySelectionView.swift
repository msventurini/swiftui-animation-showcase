//
//  EmptySelectionView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftData


struct EmptySelectionView<Content>: View where Content: View {
    
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


#Preview {
    EmptySelectionView {
        Text("a")
    }
}



struct EmptySelectionContents {
    
    let labelText: String
    let systemImage: String
    let description: String
    
}
