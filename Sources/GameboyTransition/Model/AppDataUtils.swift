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
struct AppDataUtils {
    
    static var container: ModelContainer {
        
        let modelConfiguration = ModelConfiguration(isStoredInMemoryOnly: true)
        
        let container = try! ModelContainer(for: ConsoleModel.self, configurations: modelConfiguration)

        insertDefaultDataAt(context: container.mainContext)
        
        return container
    }
    
    static func insertDefaultDataAt(context: ModelContext) {
        ContainerProvider
            .allContainerModels
            .forEach( { context.insert($0) } )
    }
    
    enum ContainerProvider: Int, Hashable, Identifiable, CaseIterable {
        
        public var id: Int {
            return self.rawValue
        }
        
        case gameboyDMG = 0
        case gameboyAdvance = 1
        case nintendoSwitch = 2
        
        var description: String {
            switch self {
            case .gameboyDMG: return "Gameboy"
            case .gameboyAdvance: return "Gameboy Advance"
            case .nintendoSwitch: return "Nintendo Switch"
            }
        }
        
        static var allContainerModels: [ConsoleModel] {
            return ContainerProvider
                .allCases
                .map({ ConsoleModel(containerName: $0.description) })
        }
        
        var releaseOrderNumber: Int {
            switch self {
            case .gameboyDMG:
                0
            case .gameboyAdvance:
                1
            case .nintendoSwitch:
                2
            }
        }
        
    }
    
}
