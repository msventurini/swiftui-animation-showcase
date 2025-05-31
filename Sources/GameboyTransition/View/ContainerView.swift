//
//  ContainerView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 30/05/25.
//

import SwiftUI
import SwiftData

struct ContainerView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \ConsoleSection.id, order: .forward)
    var sections: [ConsoleSection]
        
    var selected: Container? = nil
    
        
    var body: some View {
        
        if let selected {
            List(selected.sections) { section in
                HStack {
                    Text(section.sectionName)
                    Text(section.console?.containerName ?? " - ")
                }
                
                
            }
        }
        
       
        
    }
    
}


#Preview(traits: .modifier(ContainerPreviewModifier())) {
    ContainerView()
}
