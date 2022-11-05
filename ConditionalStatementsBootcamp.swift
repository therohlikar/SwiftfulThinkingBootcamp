//
//  ConditionalStatementsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 05.11.2022.
//

import SwiftUI

struct ConditionalStatementsBootcamp: View {
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    @State var showCapsule: Bool = false
    @State var isLoading: Bool = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("IS LOADING: \(isLoading.description)"){
                isLoading.toggle()
            }
            
            if isLoading {
                ProgressView() {
                    Text("The app is loading. Do not turn off your little thingy.")
                }
            }
            
//            Button("Circle Button: \(showCircle.description)") {
//                showCircle.toggle()
//            }
//
//            Button("Rectangle Button: \(showRectangle.description)") {
//                showRectangle.toggle()
//            }
//
//            Button("Capsule Button: \(showCapsule.description)") {
//                showCapsule.toggle()
//            }
//
//
//            if showCircle {
//                Circle()
//                    .frame(width: 100, height: 100)
//            }
//
//            if showRectangle {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 100, height: 100)
//            }
//            if (showCircle && showRectangle) || showCapsule {
//                Capsule(style: .continuous)
//                    .frame(width: 200, height: 100)
//            }
//
//            Spacer()
        }
    }
}

struct ConditionalStatementsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalStatementsBootcamp()
    }
}
