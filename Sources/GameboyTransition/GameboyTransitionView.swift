//
//  GameboyTransitionView.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 23/05/25.
//


import SwiftUI
import Observation

public struct GameboyTransitionView: View {
    
    @State private var isClicked = false
    @State private var console: Gameboy = Gameboy.dmg
    
    public init() {
        
    }
    
    public var body: some View {
        VStack {
            
            ZStack {
//                Text("asasda")
                ZStack {

                    Consolebody(
                        redComponent: console.bodyColor.redComponent,
                        greenComponent: console.bodyColor.greenComponent,
                        blueComponent: console.bodyColor.blueComponent,
                        opacityComponent: console.bodyColor.opacityComponent,
                        bodyOriginX: console.origin.x,
                        bodyOriginY: console.origin.y,
                        bodyWidth: console.bodySize.width,
                        bodyHeight: console.bodySize.height,
                        rotationAngle: isClicked ? (2 * CGFloat.pi) : 0,
                        console: console
                    )

                    HStack(spacing: isClicked ? 72 : 22) {
                        
                        ZStack {
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 24)
                            Rectangle()
                                .fill(.black)
                                .frame(width: 24, height: 10)
                        }
                        .frame(width: 32 ,height: 32)
                        .background(console.bodyColor.asSwiftUIColor())
                        .drawingGroup(opaque: true)
                        
                        HStack(spacing: 4) {
                            Circle()
                            
                                .fill(.black)
                                .frame(width: 12, height: 12)
                                .frame(width: 12, height: 24, alignment: .center)
                            
                            Circle()
                            
                                .fill(.black)
                                .frame(width: 12, height: 12)
                                .frame(width: 12, height: 24, alignment: .top)
                            
                        }
                        .frame(width: 32 ,height: 32)
                        .background(console.bodyColor.asSwiftUIColor())
                        .drawingGroup()
                    }
                    .offset(y: isClicked ? 0 : 25)
                    
                    //Console screen bezel
                    Rectangle()
                        .size(console.screenBezelSize, anchor: .center)
                        .fill(.black)
                        .padding(.top,(console.offSetpadding))
                    
                    
                    
                    //Console screen
                    Rectangle()
                    
                        .fill(.green)
                        .frame(width: (isClicked ? 61 : 47), height: (isClicked ? 41 : 43))
                        .offset(y: (isClicked ? -2 : -25))
                    
                    
                    
                    
                }
                .frame(width: 175, height: 175, alignment: .center)
                
                .drawingGroup()
                .onTapGesture {
                    withAnimation(.bouncy) {
                        isClicked.toggle()
                        console = console.toggled()
                        
                    }
                }
                
            }
        }
        //        .drawingGroup()
        
        
    }
}
