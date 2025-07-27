//
//  AppDataUtils+.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//

import SwiftUI

//extension AppDataUtils {
//    public enum ContainerData: Int, Hashable, Identifiable, CaseIterable {
//        
//        public var id: Int {
//            return self.rawValue
//        }
//        
//        case gameboyDMG = 0
//        case gameboyAdvance = 1
//        case nintendoSwitch = 2
//        
//        var description: String {
//            switch self {
//            case .gameboyDMG: return "Gameboy"
//            case .gameboyAdvance: return "Gameboy Advance"
//            case .nintendoSwitch: return "Nintendo Switch"
//            }
//        }
//        
//        var name: String {
//            self.description
//        }
//        
//        var structure: ShapeLayoutDataLegacy {
//            return ShapeLayoutDataLegacy(
//                containerID: self.containerID,
//                chronologicalNumber: self.chronologicalNumber,
//                containerName: self.name,
//                width: self.width,
//                height: self.height
//            )
//        }
//        
//        var swiftDataModel: ShapeLayoutDataLegacy {
//            return ShapeLayoutDataLegacy(
//                containerID: self.containerID,
//                chronologicalNumber: self.chronologicalNumber,
//                containerName: self.name,
//                width: self.width,
//                height: self.height
//            )
//        }
//        
//        var containerID: ContainerID {
//            switch self {
//            case .gameboyDMG: .gameboyDMG
//            case .gameboyAdvance: .gameboyAdvance
//            case .nintendoSwitch: .nintendoSwitch
//            }
//        }
//        
//        static var allContainerModels: [ShapeLayoutDataLegacy] {
//            return ContainerData
//                .allCases
//                .map({ ShapeLayoutDataLegacy(
//                    containerID: $0.containerID,
//                    chronologicalNumber: $0.chronologicalNumber,
//                    containerName: $0.name,
//                    width: $0.width,
//                    height: $0.height
//                ) })
//        }
//        
//        var chronologicalNumber: Int {
//            return self.rawValue
//        }
//        
//        var width: Double {
//            switch self {
//            case .gameboyDMG: 90
//            case .gameboyAdvance: 148
//            case .nintendoSwitch: 240
//            }
//        }
//        
//        var height: Double {
//            switch self {
//            case .gameboyDMG: 148
//            case .gameboyAdvance: 82
//            case .nintendoSwitch: 102
//            }
//        }
//
//    }
//    
//}
