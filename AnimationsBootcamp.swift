//
//  AnimationsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 06.11.2022.
//

import SwiftUI

struct AnimationsBootcamp: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            Button("isAnimated: \(isAnimated.description)") {
//                withAnimation(
//                    Animation
//                        .default
//                        .repeatForever(autoreverses: true))
//                {
//                    isAnimated.toggle()
//                }
                
                isAnimated.toggle()
            }
            
            Spacer()
            
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? Color.red : Color.green)
                .frame(width: isAnimated ? 100 : 300, height: isAnimated ? 100 : 300)
                .offset(y: isAnimated ? 300 : 0)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .animation(Animation.default.speed(0.5), value: isAnimated)
            
            Spacer()
        }
    }
}

struct AnimationsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsBootcamp()
    }
}
