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
        
        Rectangle()
            .fill(.secondary)
            .frame(width: console.width, height: console.height)
            .overlay {
                Text(console.containerName)
            }
        
        
    }
}
