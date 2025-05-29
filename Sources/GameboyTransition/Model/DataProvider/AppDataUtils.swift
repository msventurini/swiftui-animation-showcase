//
//  AppDataUtils.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//


import SwiftUI
import Observation
import SwiftData

@MainActor
public struct AppDataUtils {
    
    public static var container: ModelContainer {
        
        let modelConfiguration = ModelConfiguration(isStoredInMemoryOnly: true)
        
        let container = try! ModelContainer(for: Console.self, configurations: modelConfiguration)

        insertDefaultDataAt(context: container.mainContext)
        
        return container
    }
    
    public static func insertDefaultDataAt(context: ModelContext) {
        ContainerProvider
            .allContainerModels
//            .forEach( { context.insert($0) } )
            .forEach { console in
                context.insert(console)
            }
        
        try? context.save()
    }
    
    
}

struct ConsoleFrameTesting: View {
    var body: some View {
        ForEach(AppDataUtils.ContainerProvider.allCases) { container in
            Rectangle()
                .frame(width: container.width, height: container.height)
        }
    }
}

#Preview(traits: .modifier(ContainerPreviewModifier())) {
//    ConsoleFrameTesting()
    ContainerSelectionView()
}
