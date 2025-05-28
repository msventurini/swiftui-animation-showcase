//
//  EmptySelectionView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import Observation
import SwiftData

struct EmptySelectionView: View {
    var body: some View {
        ContentUnavailableView {
            Label("Select Anything", systemImage: "gamecontroller.circle")
        } description: {
            Text("You'll be amazed by the animations!")
        } actions: {
            Text("a")
        }
    }
}


#Preview {
    EmptySelectionView()
}

extension FocusedValues {
    @Entry var emptySelectionContents: EmptySelectionContents? = nil
}


struct EmptySelectionContents {
    
    let labelText: String
    let systemImage: String
    let description: String
    
}
