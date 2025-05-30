//
//  ContainerCollection.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 29/05/25.
//

import SwiftUI
import Observation

@Observable class ContainerCollection {
    
    var containers: [Container]
    
    init() {
        
        self.containers = AppDataUtils
            .ContainerData
            .allCases
            .map { containerData in
                
                let containerModel = containerData.observableModel
                
                containerModel.sections = containerData
                    .sections
                    .map({ $0.observableModelFor(container: containerModel) })

                return containerModel
                
            }
        
    }
    
    
}
