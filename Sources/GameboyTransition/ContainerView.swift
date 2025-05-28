//
//  ContainerView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//

import SwiftUI
import SwiftData

struct ContainerView: View {
    
    let console: ConsoleModel
    
    var body: some View {
        Text(console.containerName)
    }
}
