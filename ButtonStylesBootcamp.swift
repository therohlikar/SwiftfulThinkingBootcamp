//
//  ButtonStylesBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/10/22.
//

import SwiftUI

struct ButtonStylesBootcamp: View {
    var body: some View {
        VStack{
            Button("Whatever") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(.roundedRectangle(radius: 10))
            
            Button("Whatever") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            
            Button("Whatever") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.small)
            
            Button("Whatever") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.mini)
        }
        .padding()
    }
}

struct ButtonStylesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStylesBootcamp()
    }
}
