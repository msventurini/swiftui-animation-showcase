//
//  TesteCanvas.swift
//  swiftui-animation-showcase
//
//  Created by Matheus Silveira Venturini on 26/05/25.
//
import SwiftUI

enum ButtonContent: String {
    case emptyButton = "circle.fill"
    
    case aButton = "a.circle.fill"
    case bButton = "b.circle.fill"
    case xButton = "x.circle.fill"
    case yButton = "y.circle.fill"
    
    case upButton = "arrowtriangle.up.circle.fill"
    case downButton = "arrowtriangle.down.circle.fill"
    case leftButton = "arrowtriangle.left.circle.fill"
    case rightButton = "arrowtriangle.right.circle.fill"
    
}

@Observable class ButtonModel {
    
    
    
}

struct ButtonView: View {
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            
            
            Canvas { context, size in
                
                let biggerSide = max(size.height, size.width)
                let blurRadius = biggerSide * 0.02
                
                
                
                let rect: CGRect = .init(origin: .zero, size: size)
                
                let path = Circle().path(in: rect)
                
                context.fill(path, with: .color(.gray))
                
                context.addFilter(.alphaThreshold(min: 0.45, color: .black))
                
                context.addFilter(.blur(radius: blurRadius))
                
                
                
                
                context.drawLayer { ctx in
                    
                    let circle0 = ctx.resolveSymbol(id: 0)!
                    let circle1 = ctx.resolveSymbol(id: 1)!
                    
                    ctx.draw(circle0, at: .init(x: size.width * 0.5, y: size.height * 0.5))
                    ctx.draw(circle1, at: .init(x: size.width * 0.5, y: size.height * 0.5))
                }
                
            } symbols: {
                
                Image(systemName: "a.circle.fill")
                    .resizable()
                    .opacity(animate ? 0 : 1)
                    .tag(0)
                
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .opacity(animate ? 1 : 0)
                    .tag(1)
            }
//            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animate)
            .animation(.easeInOut(duration: 2), value: animate)

            
        }
        .task {
            animate = true
        }

    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {

#Preview {
    
    ButtonView()
        .frame(width: 25 ,height: 25)
        .drawingGroup()
}

//        ContentView()
        //            .background(.red)
//            .frame(width: 50 ,height: 50)
            
//    }
//}

//#Preview {
//
//    @Previewable @State var isTapped: Bool = false
//    VStack {
//        ContentViewTeste()
//            .background(.red)
//
//
//        Button {
//            withAnimation {
//                isTapped.toggle()
//            }
//        } label: {
//            Text("aaa")
//        }
//
//    }
//
//}
