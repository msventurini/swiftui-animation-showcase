//
//  ContainerView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 30/05/25.
//

import SwiftUI
import Observation

struct ContainerView: View {

    @Binding var selected: Container
    
        
    var body: some View {
        ConsoleFrameLayout {
            ForEach(selected.sections.sorted(by: { section1, section2 in
                section1.id < section2.id
            })) { section in
                Rectangle()
                    .strokeBorder(lineWidth: 4)
                    .overlay {
                        Text(section.id.description)
                    }
                    .containerValue(\.frameWidth, section.containerWidth)
                    .containerValue(\.frameHeight, section.containerHeight)
                
                    .containerValue(\.centerDistanceX, section.centerDistanceX)
                    .containerValue(\.centerDistanceY, section.centerDistanceY)
                    .frame(width: section.width, height: section.height)
            }
        }
    }
}


//#Preview(traits: .modifier(ContainerPreviewModifier())) {
//    ContainerView()
//}
