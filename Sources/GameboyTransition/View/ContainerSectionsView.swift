//
//  ContainerSectionsView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//


import SwiftUI
import SwiftData

struct ContainerSectionsView: View {
    let console: ConsoleModel
    
    var body: some View {
        
        Rectangle()
            .fill(.secondary)
            .overlay {
                Text(console.containerName)
            }
        
        
    }
}