//
//  ContainerID.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//


import SwiftUI

public enum ContainerID: Int, Hashable, Identifiable, CaseIterable, Codable, Sendable {
    
    public var id: Int {
        return self.rawValue
    }
    
    case gameboyDMG = 0
    case gameboyAdvance = 1
    case nintendoSwitch = 2
}
