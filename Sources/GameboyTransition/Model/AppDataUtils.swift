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
        
        let container = try! ModelContainer(for: ConsoleModel.self, configurations: modelConfiguration)

        insertDefaultDataAt(context: container.mainContext)
        
        return container
    }
    
    public static func insertDefaultDataAt(context: ModelContext) {
        ContainerProvider
            .allContainerModels
            .forEach( { context.insert($0) } )
    }
    
    public enum ContainerProvider: Int, Hashable, Identifiable, CaseIterable {
        
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
                .map({ ConsoleModel(
                    containerName: $0.description,
                    width: $0.width,
                    height: $0.height
                ) })
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
        
        var width: Double {
            switch self {
            case .gameboyDMG:
                90
            case .gameboyAdvance:
                144
            case .nintendoSwitch:
                240
            }
        }
        
        var height: Double {
            switch self {
            case .gameboyDMG:
                148
            case .gameboyAdvance:
                82
            case .nintendoSwitch:
                102
            }
        }
        
        
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

#Preview {
    ConsoleFrameTesting()
}
