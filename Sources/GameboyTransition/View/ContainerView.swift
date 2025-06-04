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
                ForEach(selected.sections) { section in
//                    Rectangle()
//                        .stroke()
//                        .frame(width: section.width, height: section.height)
//                        .overlay {
//                            Text(section.id.description)
//                        }
                        
                   SectionView(section: section)
                        .containerValue(\.centerDistanceX, section.centerDistanceX)
                        .containerValue(\.centerDistanceY, section.centerDistanceY)

                }
            }
    }
}





#Preview(traits: .modifier(ContainerPreviewModifier())) {
//    ContainerView()
    GameBoyTransition()
}
