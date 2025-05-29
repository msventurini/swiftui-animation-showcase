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
        
        ConsoleFrameLayout {
            ContainerSectionsView(console: console)
                .containerValue(\.frameWidth, console.width)
                .containerValue(\.frameHeight, console.height)
        }
        
    }
}

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
