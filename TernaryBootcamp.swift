//
//  TernaryBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 05.11.2022.
//

import SwiftUI

struct TernaryBootcamp: View {
    
    @State var isStartingState: Bool = false
    
    var body: some View {
        VStack{
            Button("Button") {
                isStartingState.toggle()
            }
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white.opacity(0.0))
                .frame(width: 200, height: .infinity)
                .background((isStartingState ? Color.red : Color.blue))
            
            Spacer()
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct TernaryBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TernaryBootcamp()
    }
}
