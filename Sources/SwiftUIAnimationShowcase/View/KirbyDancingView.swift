//
//  KirbyDancingView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 22/05/25.
//


import SwiftUI
import KirbyJumpingAnimation

struct KirbyDancingView: View {
    
    let color: Color

    
    var body: some View {
        Rectangle()
            .fill(color)
    }
}

#Preview {
    KirbyDancingView(color: .red)
}
