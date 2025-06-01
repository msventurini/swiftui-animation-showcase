//
//  AppDataUtils.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 28/05/25.
//


import SwiftUI
import Observation
import SwiftData

public struct AppDataUtils {

    public static func getContainerCollection() -> [Container] {
        return AppDataUtils.ContainerData
            .allCases
            .map { containerData in
                
                var containerModel = containerData.swiftDataModel
                
                let sections = containerData
                    .sections
                    .map { section in
                        let teste = section.observableModelFor(container: containerModel)
//                        print("\(teste.id) - \(teste.width)")
                        print("\(section.name) - \(section.rawValue)")
                        return teste
                        
                    }
                containerModel.sections = sections//.sorted(by: { $0.id < $1.id })
                
                
             return containerModel
            }
    }
   
}

struct ConsoleFrameTesting: View {
    var body: some View {
        ForEach(AppDataUtils.ContainerData.allCases) { container in
            Rectangle()
                .frame(width: container.width, height: container.height)
        }
    }
}
