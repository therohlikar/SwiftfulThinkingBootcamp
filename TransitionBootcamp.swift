//
//  TransitionBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 06.11.2022.
//

import SwiftUI

struct TransitionBootcamp: View {
    @State var showView : Bool = false
    
    var body: some View {
            VStack{
                Button("BUTTON") {
                    withAnimation{
                        showView.toggle()
                    }
                    
                }

                Spacer()
                
                if showView {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                        .transition(.move(edge: .bottom))
                }
            }.ignoresSafeArea(edges: .bottom)
            
            
    }
}

struct TransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionBootcamp()
    }
}
