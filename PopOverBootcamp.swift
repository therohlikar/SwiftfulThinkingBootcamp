//
//  PopOverBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 11/24/22.
//

import SwiftUI

struct PopOverBootcamp: View {
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack{
            Color.orange
                .ignoresSafeArea(edges: .all)
            
            VStack{
                Button("BUTTON") {
                    withAnimation(.spring()) {
                        showNewScreen.toggle()
                    }

                }
                .font(.largeTitle)
                Spacer()
            }
            
            //method 1
//            .sheet(isPresented: $showNewScreen) {
//                NewScreen()
//            }
            
            //method 2
            ZStack{
                if showNewScreen {
                    NewScreen(showNewScreen: $showNewScreen)
                        .padding(.top, 100)
                        .transition(.move(edge: .bottom))
                }
            }
            .zIndex(2.0)
            
            //method 3
//            NewScreen(showNewScreen: $showNewScreen)
//                .padding(.top, 100)
//                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
//                .animation(.spring(), value: showNewScreen)
            
        }
    }
}

struct NewScreen: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showNewScreen: Bool
    
    var body: some View{
        ZStack(alignment: .topTrailing){
            Color.purple
                .ignoresSafeArea(edges: .all)
            
            Button {
                showNewScreen.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }

        }
    }
}

struct PopOverBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PopOverBootcamp()
    }
}
