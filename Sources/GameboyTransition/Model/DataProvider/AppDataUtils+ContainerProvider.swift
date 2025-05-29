//
//  AppDataUtils+.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//

import SwiftUI

extension AppDataUtils {
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
        
        static var allContainerModels: [Console] {
            return ContainerProvider
                .allCases
                .map({ Console(
                    chronologicalNumber: $0.chronologicalNumber,
                    containerName: $0.description,
                    width: $0.width,
                    height: $0.height
                ) })
        }
        
        var chronologicalNumber: Int {
            return self.rawValue
        }
        
        var width: Double {
            switch self {
            case .gameboyDMG: 90
            case .gameboyAdvance: 144
            case .nintendoSwitch: 240
            }
        }
        
        var height: Double {
            switch self {
            case .gameboyDMG: 148
            case .gameboyAdvance: 82
            case .nintendoSwitch: 102
            }
        }
    }
    
}
