//
//  GBShapeData.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 04/06/25.
//


import SwiftUI
import AnimationFoundation
//
//enum SectionData: Int, Identifiable, Hashable, Codable, CaseIterable {
//    
//    public var id: Int {
//        return rawValue
//    }
//    
//    case screenLeft = 0
//    case screenRight
//    case controllerLeft
//    case controllerRight
//    
//    var name: String {
//        switch self {
//        case .screenLeft: "Screen Left"
//        case .screenRight: "Screen Right"
//        case .controllerRight: "Controller Right"
//        case .controllerLeft: "Controller Left"
//        }
//    }
//    
//    func observableModelFor(container: Container) -> ConsoleSection {
//        
//        return .init(
//            id: self.id,
//            originX: self.originX(container: container),
//            originY: self.originY(container: container),
//            widthRatioToContainer: self.widthProportion(container: container),
//            heightRatioToContainer: self.heightProportion(container: container),
//            containerWidth: self.containerWidth(container: container),
//            containerHeight: self.containerHeight(container: container),
//        )
//    }
//    
//   
//    public func originX(container: Container) -> Double {
//        switch (container.containerID, self) {
//        case (.gameboyDMG, .screenLeft): .zero
//        case (.gameboyDMG, .screenRight): 0.5
//        case (.gameboyDMG, .controllerLeft): .zero
//        case (.gameboyDMG, .controllerRight): 0.5
//            
//        case (.gameboyAdvance, .controllerLeft): .zero
//        case (.gameboyAdvance, .screenLeft): 0.2
//        case (.gameboyAdvance, .screenRight): 0.5
//        case (.gameboyAdvance, .controllerRight): 0.8
//        
//        case (.nintendoSwitch, .controllerLeft):    .zero
//        case (.nintendoSwitch, .screenLeft):     0.15
//        case (.nintendoSwitch, .screenRight):     0.50
//        case (.nintendoSwitch, .controllerRight): 0.85
//        }
//    }
//    
//    public func originY(container: Container) -> Double {
//        switch (container.containerID, self) {
//        case (.gameboyDMG, .screenLeft), (.gameboyDMG, .screenRight): .zero
//        case (.gameboyDMG, .controllerLeft), (.gameboyDMG, .controllerRight): 0.5
//        case (.gameboyAdvance, _), (.nintendoSwitch, _): .zero
//        }
//    }
//    
//    public func widthProportion(container: Container) -> Double {
//        switch (container.containerID, self) {
//        case (.gameboyDMG, _): 0.5
//        
//        case (.gameboyAdvance, .screenLeft): 0.3
//        case (.gameboyAdvance, .screenRight): 0.3
//        case (.gameboyAdvance, .controllerLeft): 0.2
//        case (.gameboyAdvance, .controllerRight): 0.2
//            
//        case (.nintendoSwitch, .screenLeft): 0.35
//        case (.nintendoSwitch, .screenRight): 0.35
//        case (.nintendoSwitch, .controllerLeft): 0.15
//        case (.nintendoSwitch, .controllerRight): 0.15
//        }
//    }
//
//    public func heightProportion(container: Container) -> Double {
//        switch (container.containerID, self) {
//        case (.gameboyDMG, _): 0.5
//        case (.gameboyAdvance, _): 1.0
//        case (.nintendoSwitch, _): 1.0
//        }
//    }
//    
//    public func containerWidth(container: Container) -> Double {
//        return container.width
//    }
//    
//    public func containerHeight(container: Container) -> Double {
//        return container.height
//    }
//
//    
//    public func getColor(console: Container) -> AnimatableColor {
//        
//        switch (console.containerID, self) {
//        case (.gameboyDMG, _): AnimatableColor(red: 190/255, green: 190/255, blue: 190/255, opacity: 1)
//        case (.gameboyAdvance, _): AnimatableColor(red: 94/255, green: 92/255, blue: 230/255, opacity: 1)
//        case (.nintendoSwitch, .screenLeft): AnimatableColor(red: 0, green: 0, blue: 0, opacity: 1)
//        case (.nintendoSwitch, .screenRight): AnimatableColor(red: 0, green: 0, blue: 0, opacity: 1)
//        case (.nintendoSwitch, .controllerLeft): AnimatableColor(red: 1, green: 0, blue: 0, opacity: 1)
//        case (.nintendoSwitch, .controllerRight): AnimatableColor(red: 0, green: 0, blue: 1, opacity: 1)
//        }
//    }
//    
//}


struct GBShapeData: ShapeSectionProvider {
    let width: CGFloat = 90
    
    let height: CGFloat = 148
    
    
    var id: SectionedShapeLegacy {
        .gb
    }
    var leftScreenShapeData: AnimatableShapeModel { .init(
        id: .leftScreen,
        coordinates: .init(
            topLeading: .init(x: 8, y: 8),
        ),
        cornerRadii: .init(topLeading: 8),
        angleValues: .init(
            topLeading: .init(
                startAngle: Angle(degrees: 180),
                endAngle: Angle(degrees: 270)),
        ),
        geometryValues: .init(referenceSize: CGSize(width: 45, height: 74), horizontalScale: 1))
    }
    
    var rightScreenShapeData: AnimatableShapeModel { .init(
        id: .rightScreen, horizontalInverseOf: leftScreenShapeData)
    }
    var leftControllerShapeData: AnimatableShapeModel { .init(
        id: .leftController, coordinates: .init(
            bottomLeading: .init(x: 8, y: -8),
        ),
        cornerRadii: .init(
            bottomLeading: 8,
        ),
        angleValues: .init(
            bottomLeading: .init(startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180))),
        geometryValues: AnimatableShapeGeometryValues(referenceSize:  CGSize(width: 45, height: 74), horizontalScale: 1)
    )
    }
    var rightControllerShapeData: AnimatableShapeModel { .init(
        id: .rightController, horizontalInverseOf: self.leftControllerShapeData,
        changingCoordinatesTo: .init(
            bottomLeading: .init(x: 32, y: -32)
        ),
        changingCornerRadiiTo: .init(
            bottomLeading: 32
        ),
        changingAngleValuesTo: .init(
            bottomLeading:.init(
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180))
        )
    )
    }
}


struct GBShapeDataDebug: View {
    
    var gbShape = GBShapeData()
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                ArcCornersShape(shapeModel: gbShape.leftScreenShapeData)
                    .fill(.black)
                ArcCornersShape(shapeModel: gbShape.rightScreenShapeData)
                    .fill(.gray)
            }
            
            
            
            HStack(spacing: 0) {
                ArcCornersShape(shapeModel: gbShape.leftControllerShapeData)
                    .fill(.gray)
                
                ArcCornersShape(shapeModel: gbShape.rightControllerShapeData)
                    .fill(.gray)
                
            }
        }
//        .aspectRatio(90/148, contentMode: .fit)
        .frame(width: 90, height: 148)
        
        
        
    }
    
    
}

#Preview {
    GBShapeDataDebug()
}
