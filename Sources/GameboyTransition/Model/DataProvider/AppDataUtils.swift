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
        
        let container = try! ModelContainer(for: Container.self, configurations: modelConfiguration)

        insertDefaultDataAt(context: container.mainContext)
        
        return container
    }
    
    public static func insertDefaultDataAt(context: ModelContext) {
        ContainerProvider
            .allCases
            .forEach { containerData in
                
                let containerModel = containerData.swiftDataModel
                context.insert(containerModel)
                
                containerData
                    .sections
                    .forEach { section in
                        
                        let sectionModel = section.swiftDataModelFor(container: containerModel)
                        
                        sectionModel.console = containerModel
                        
                        context.insert(sectionModel)
                        
                    }
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
