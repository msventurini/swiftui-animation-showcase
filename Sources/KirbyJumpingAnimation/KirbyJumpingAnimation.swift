//
//  KirbyJumpingAnimation.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 21/05/25.
//

import SwiftUI

struct kirbyTimelineView: View {
    
    @Namespace private var animation
    @State private var isClicked = false
    
//    @State private var isClicked: Bool {
//        ((redIsClicked || greenIsClicked || blueIsClicked) ? 2 : 3)
//    }
    
    let kirbyPink1 = Color(red: 215/255, green: 72/255, blue: 148/255)
    let kirbyPink2 = Color(red: 223/255, green: 109/255, blue: 169/255)
    let kirbyPink3 = Color(red: 231/255, green: 145/255, blue: 191/255)
    let kirbyPink4 = Color(red: 239/255, green: 182/255, blue: 212/255)
    let kirbyPink5 = Color(red: 247/255, green: 218/255, blue: 234/255)
    let kirbyShoes = Color(red: 212/255, green: 41/255, blue: 94/255)

    var body: some View {
        
        TimelineView(.animation()) { context in
            
            let test: Bool = (((Calendar.current.component(.second, from: context.date) % 2)) != 0)
            
            GeometryReader { kirbyGeometry in
                ZStack {
                    
                    
                    GeometryReader { armGeometry in
                        Ellipse()
                            .fill(kirbyPink3)
                            .rotation3DEffect(.degrees(isClicked ? -90 : -20), axis: (x: 0.0, y: 0.0, z: 1.0),
                                              anchor: .init(x: 0.5,
                                                            y: 0.25))

                    }
                    .frame(width: kirbyGeometry.size.width / 3, height: kirbyGeometry.size.width / 2)
                    .position(x: kirbyGeometry.frame(in: .local).midX / 4, y: kirbyGeometry.frame(in: .local).midY * 3/2)
                    .rotation3DEffect(.degrees(isClicked ? -1 : 1), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .rotation3DEffect(.degrees(isClicked ? 35 : 15), axis: (x: 0.0, y: 0.0, z: 1.0))
                    
                    ZStack {
                        
                        GeometryReader { froontFeetGeometry in
                            Capsule(style: .continuous)
                                .fill(kirbyShoes)
                                .rotation3DEffect(.degrees(isClicked ? -30 : -20), axis: (x: 0.0, y: 0.0, z: 1.0),
                                                  anchor: .init(x: 0.5,
                                                                y: 0.25))
                            
                        }
                        .frame(width: kirbyGeometry.size.width * 3 / 8, height: kirbyGeometry.size.width / 2)
                        .position(x: kirbyGeometry.frame(in: .local).midX * 5/4, y: kirbyGeometry.frame(in: .local).maxY * 0.9)
                        
                        GeometryReader { backFeetGeometry in
                            Capsule(style: .continuous)
                                .fill(kirbyShoes)
                                .rotation3DEffect(.degrees(isClicked ? 85 : 75), axis: (x: 0.0, y: 0.0, z: 1.0),
                                                  anchor: .init(x: 0.5,
                                                                y: 0.25))
                            
                        }
                        .frame(width: kirbyGeometry.size.width * 3 / 8, height: kirbyGeometry.size.width / 2)
                        .position(x: kirbyGeometry.frame(in: .local).midX * 3/5, y: kirbyGeometry.frame(in: .local).maxY * 0.9)
                    }
                    .rotation3DEffect(.degrees(isClicked ? 1 : -1), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .rotation3DEffect(.degrees(isClicked ? 35 : -35), axis: (x: 0.0, y: 0.0, z: 1.0))
                    

                    
                    
                    Circle()
                        .fill(kirbyPink4)
                    
                    Circle()
                        .fill(kirbyPink5)
                        .frame(width: kirbyGeometry.size.width / 1.5)
                        .position(x: kirbyGeometry.frame(in: .local).midX * 1.25, y: kirbyGeometry.frame(in: .local).midY * 0.75)
                    
                    
                    
                    GeometryReader { kirbyFace in
                        // Olhos
                        ZStack {
                            
                            Group {
                                GeometryReader { eyeGeometry in
                                    ZStack {
                                        Ellipse()
                                            .foregroundColor(.black)
                                        
                                        Ellipse()
                                            .trim(from: 0.0, to: 0.5)
                                            .frame(width: eyeGeometry.size.width * 0.9, height: eyeGeometry.size.height * 0.9)
                                            .foregroundColor(.blue)
                                            .position(x: eyeGeometry.frame(in: .local).midX,
                                                      y: eyeGeometry.frame(in: .local).midY)
                                        //fazer esse recorte com clipped depois
//                                        Circle()
//                                            .frame(width: eyeGeometry.size.width * 0.9, height: eyeGeometry.size.width * 0.9)
                                        
                                        Ellipse()
                                            .frame(width: eyeGeometry.size.width / 2, height: eyeGeometry.size.width)
                                            .foregroundColor(.white)
                                            .position(x: eyeGeometry.frame(in: .local).midX,
                                                      y: eyeGeometry.frame(in: .local).minY // coloca no topo do olho
                                                      + eyeGeometry.size.height * 0.055 // adiciona 5,55% de margem
                                                      + eyeGeometry.size.width / 2) //adiciona metade do tamanho da parte branca do olho
                                    }
                                }
                                .frame(
                                    width: kirbyFace.size.width / 5,
                                    height: kirbyFace.size.height * 6/9
                                )
                                .position(x: kirbyFace.frame(in: .local).midX
                                          - (kirbyFace.size.width / 12) * 2,
                                          y: kirbyFace.frame(in: .local).midY * 2 / 3)
                                
                                GeometryReader { eyeGeometry in
                                    ZStack {
                                        Ellipse()
                                            .foregroundColor(.black)
                                        
                                        Ellipse()
                                            .trim(from: 0.0, to: 0.5)
                                            .frame(width: eyeGeometry.size.width * 0.9, height: eyeGeometry.size.height * 0.9)
                                            .foregroundColor(.blue)
                                            .position(x: eyeGeometry.frame(in: .local).midX,
                                                      y: eyeGeometry.frame(in: .local).midY)
                                        //fazer esse recorte com clipped depois
//                                        Circle()
//                                            .frame(width: eyeGeometry.size.width * 0.9, height: eyeGeometry.size.width * 0.9)
//
                                        
                                        Ellipse()
                                            .frame(width: eyeGeometry.size.width / 2, height: eyeGeometry.size.width)
                                            .foregroundColor(.white)
                                            .position(x: eyeGeometry.frame(in: .local).midX,
                                                      y: eyeGeometry.frame(in: .local).minY // coloca no topo do olho
                                                      + eyeGeometry.size.height * 0.055 // adiciona 5,55% de margem
                                                      + eyeGeometry.size.width / 2) //adiciona metade do tamanho da parte branca do olho
                                    }
                                }
                                .frame(
                                    width: kirbyFace.size.width / 5,
                                    height: kirbyFace.size.height * 6/9
                                )
                                .position(x: kirbyFace.frame(in: .local).midX
                                          + (kirbyFace.size.width / 12) * 2,
                                          y: kirbyFace.frame(in: .local).midY * 2 / 3)
                                
                                
                            }
                            
                        }
                        
                        Ellipse()
                            .trim(from: 0.0, to: 0.5)
                            .stroke(Color.black, lineWidth: kirbyFace.size.width * 0.02)
                            .frame(width: kirbyFace.size.width / 4, height: kirbyFace.size.height / 5)
                            .position(x: kirbyFace.frame(in: .local).midX, y: kirbyFace.frame(in: .local).maxY - kirbyFace.size.height / 8)
                        
                        Ellipse()
                            .frame(width: kirbyFace.size.width / 4.5, height: kirbyFace.size.height / 7)
                            .position(x: kirbyFace.frame(in: .local).minX + kirbyFace.size.width / 8, y: kirbyFace.frame(in: .local).midY * 4 / 3)
                            .foregroundColor(kirbyPink1)

                        Ellipse()
                            .frame(width: kirbyFace.size.width / 4.5, height: kirbyFace.size.height / 7)
                            .position(x: kirbyFace.frame(in: .local).maxX - kirbyFace.size.width / 8, y: kirbyFace.frame(in: .local).midY * 4 / 3)
                            .foregroundColor(kirbyPink2)
                        
                        
                        
                        
                        
                        
                    }
                    .frame(width: kirbyGeometry.size.width * 0.64, height: kirbyGeometry.size.height * 0.435)
    //                .background(.gray)
                    .rotation3DEffect(.degrees(-45), axis: (x:0, y: 1.0, z: 0.0), perspective: 1)
                    .scaleEffect(x: 1.0, y: 0.5, anchor: .center)
                    .position(x: kirbyGeometry.frame(in: .local).midX * 2/5, y: kirbyGeometry.frame(in: .local).midY)
                    
                    
                    
                    GeometryReader { armGeometry in
                        Ellipse()
                            .fill(kirbyPink4)
                            .rotation3DEffect(.degrees(isClicked ? -90 : -20), axis: (x: 0.0, y: 0.0, z: 1.0),
                                              anchor: .init(x: 0.5,
                                                            y: 0.25))
                        Ellipse()
                            .fill(kirbyPink5)
                            .frame(width: armGeometry.size.width/1.5, height: armGeometry.size.height/1.5)
                            .position(x: armGeometry.frame(in: .local).midX * 1.25, y: armGeometry.frame(in: .local).midY * 0.75)
                            .rotation3DEffect(.degrees(isClicked ? -90 : -20), axis: (x: 0.0, y: 0.0, z: 1.0),
                                              anchor: .init(x: 0.5,
                                                            y: 0.25))

                        

                    }
                    .frame(width: kirbyGeometry.size.width / 3, height: kirbyGeometry.size.width / 2)
                    .position(x: kirbyGeometry.frame(in: .local).midX * 5/3, y: kirbyGeometry.frame(in: .local).midY * 3/2)
                    .rotation3DEffect(.degrees(isClicked ? 1 : -1), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .rotation3DEffect(.degrees(isClicked ? 35 : -35), axis: (x: 0.0, y: 0.0, z: 1.0))

                    



        
                }

                .rotation3DEffect(.degrees(isClicked ? -1 : 1), axis: (x: 0.0, y: 1.0, z: 0.0))
                .rotation3DEffect(.degrees(isClicked ? -35 : 35), axis: (x: 0.0, y: 0.0, z: 1.0))

                .scaleEffect(x: (isClicked ? 1.05 : 0.95), y:  (isClicked ? 0.95 : 1.05), anchor: .center)
                .offset(x: (isClicked ? 0 : 0), y:  (isClicked ? 250 : -250))



    
            }
//            .onChange(of: test, perform: { v in
//                withAnimation(.easeInOut(duration: 1)) {
//                    isClicked.toggle()
//                }
//            })
            
//            .onTapGesture {
//                withAnimation(.spring()) {
//                    isClicked.toggle()
//                }
//            }
            .frame(width: 350, height: 350)
//            .background(Color.blue)
            .hueRotation(Angle(degrees: (isClicked ? 360 : 0)))

        }
    }
}
