//
//  ContentView.swift
//  SwiftUIAnimationShowcase
//
//  Created by Matheus Silveira Venturini on 21/05/25.
//

import SwiftUI
import GameboyTransition

struct ContentView: View {
    @State private var colorShown: Color?
    var body: some View {
        NavigationSplitView {
            List {
                Button("Mint") { colorShown = .mint }
                Button("Pink") { colorShown = .pink }
                Button("Teal") { colorShown = .teal }
            }
            .navigationDestination(item: $colorShown) { color in
                KirbyDancingView(color: color)
//                GameboyTransitionView()
            }
        } detail: {
//            Text("Select a color")
//            GameboyTransitionView()
        }

    }
    
}

#Preview {
    ContentView()
}



