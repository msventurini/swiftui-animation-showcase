//
//  LeftControllerShape.swift
//  gbaShapeTest
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI

#Preview {
    HStack(spacing: 2) {
        LeftControllerShape()
        
            .frame(width: 74)
        
        ScreenLeftBodyShape()
            .frame(width: 111)
        
        ScreenRightBodyShape()
            .frame(width: 111)
        
        RightControllerShape()
            .frame(width: 74)
    }
    .frame(height: 213)
    
    
    
}
