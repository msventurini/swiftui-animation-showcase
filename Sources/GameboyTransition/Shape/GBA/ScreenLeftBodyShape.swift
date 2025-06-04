//
//  ScreenBodyShape.swift
//  gbaShapeTest
//
//  Created by Matheus Silveira Venturini on 01/06/25.
//


import SwiftUI



#Preview {
    HStack(spacing: 0) {
        LeftControllerShape()
            .fill(.blue)
            .opacity(0.5)
            .frame(width: 74)
        
        ScreenLeftBodyShape()
            .fill(.red)
            .opacity(0.5)
//            .frame(width: 111)
        
//        ScreenRightBodyShape()
            .frame(width: 222)
        
        RightControllerShape()
            .fill(.blue)
            .opacity(0.5)
            .frame(width: 74)
    }
    .frame(height: 213)
    
    
    
}
