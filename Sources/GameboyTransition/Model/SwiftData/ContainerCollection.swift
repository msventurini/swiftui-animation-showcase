////
////  ContainerCollection.swift
////  swiftui-animation-showcase
////
////  Created by Matheus Silveira Venturini on 31/05/25.
////
//
//import SwiftUI
//import Observation
//import AnimationFoundation
//import Observation
//
//@Observable public class ContainerCollection {
//
//    var consoleCollection: [Container]
//
//    init() {
//        let initializedConsoleData = AppDataUtils.ContainerData
//            .allCases
//            .map { containerData in
//                
//                let containerModel = containerData.observableModel
//                containerData
//                    .sections
//                    .forEach { section in
//                        
//                        let sectionModel = section.observableModelFor(container: containerModel)
//                        
//  
//                    }
//             return containerModel
//            }
//        consoleCollection = initializedConsoleData
//        
//        guard let firstItem = initializedConsoleData.first else {
//            fatalError("Data not defined")
//        }
//    }
//}
