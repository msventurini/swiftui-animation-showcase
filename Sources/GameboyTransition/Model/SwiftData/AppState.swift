//
//  AppState.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 30/05/25.
//

import SwiftUI
import Observation

@Observable class AppState {
    
    var selectedConsole: Container
    
    init(selectedConsole: Container) {
        self.selectedConsole = selectedConsole
    }
    
    
}
