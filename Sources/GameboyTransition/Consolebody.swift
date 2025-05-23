//
//  Consolebody.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 23/05/25.
//


import SwiftUI
import Observation


public struct Consolebody: View, @preconcurrency Animatable {
    
    var redComponent: CGFloat
    var greenComponent: CGFloat
    var blueComponent: CGFloat
    var opacityComponent: CGFloat
    
    var bodyOriginX: CGFloat
    var bodyOriginY: CGFloat
    var bodyWidth: CGFloat
    var bodyHeight: CGFloat
    
    var rotationAngle: CGFloat
    
    public init(redComponent: CGFloat, greenComponent: CGFloat, blueComponent: CGFloat, opacityComponent: CGFloat, bodyOriginX: CGFloat, bodyOriginY: CGFloat, bodyWidth: CGFloat, bodyHeight: CGFloat, rotationAngle: CGFloat, console: Gameboy) {
        self.redComponent = redComponent
        self.greenComponent = greenComponent
        self.blueComponent = blueComponent
        self.opacityComponent = opacityComponent
        self.bodyOriginX = bodyOriginX
        self.bodyOriginY = bodyOriginY
        self.bodyWidth = bodyWidth
        self.bodyHeight = bodyHeight
        self.rotationAngle = rotationAngle
        self.console = console
    }
    
    public var animatableData: AnimatablePair<
        
        AnimatablePair<
            AnimatablePair< //Referente as cores
                AnimatablePair<CGFloat, CGFloat>,
                AnimatablePair<CGFloat, CGFloat>
            >, AnimatablePair< //Referente ao tamanho do corpo
                AnimatablePair<CGFloat, CGFloat>,
                AnimatablePair<CGFloat, CGFloat>
            >
        >, CGFloat
        

    > {
        get {
            AnimatablePair(
                
                AnimatablePair(
                    AnimatablePair(
                        AnimatablePair(redComponent,greenComponent),
                        AnimatablePair(blueComponent, opacityComponent),
                    ),
                    AnimatablePair(
                        AnimatablePair(bodyOriginX, bodyOriginY),
                        AnimatablePair(bodyWidth, bodyHeight),
                    )
                ), rotationAngle   
            )
        }
        set {

            redComponent = newValue.first.first.first.first
            greenComponent = newValue.first.first.first.second
            blueComponent = newValue.first.first.second.first
            opacityComponent = newValue.first.first.second.second
            
            bodyOriginX = newValue.first.second.first.first
            bodyOriginY = newValue.first.second.first.second
            bodyWidth = newValue.first.second.second.first
            bodyHeight = newValue.first.second.second.second
            
            rotationAngle = newValue.second
            
        }
    }
    
    let console: Gameboy
    
    public var body: some View {
        Canvas(
            opaque: true,
            colorMode: .linear,
            rendersAsynchronously: false
        ) { context, size in
            
            
            let midpoint = CGPoint(
                x: size.width * 0.5,
                y: size.height * 0.5
            )
            
            
            let frameRect = CGRect(
                origin: .zero,
                size: size
            )
            
            
            let framePath = Rectangle().path(in: frameRect)
            context.fill(framePath, with:
                    .color(
                        red: 1.0 - redComponent,
                        green: 1.0 - greenComponent,
                        blue: 1.0 - blueComponent,
                        opacity: 1.0)
            )
            
            context.drawLayer { layerContext in

                let rect = CGRect(
                    origin: CGPoint(x: bodyOriginX, y: bodyOriginY),
                    size: CGSize(width: bodyWidth, height: bodyHeight)
                )
                
                var transform: CGAffineTransform = CGAffineTransformMakeTranslation(midpoint.x, midpoint.y);
                transform = CGAffineTransformRotate(transform, rotationAngle);
                transform = CGAffineTransformTranslate(transform, -midpoint.x, -midpoint.y);
                
                layerContext.transform = transform
                
                let path = Rectangle().path(in: rect)
                layerContext.fill(path, with: .color(red: redComponent, green: greenComponent, blue: blueComponent, opacity: opacityComponent))
                
                
            }
            
            
        }
    }
}

#Preview {
    GameboyTransitionView()
        
    
    //    ConsoleBody()
}



