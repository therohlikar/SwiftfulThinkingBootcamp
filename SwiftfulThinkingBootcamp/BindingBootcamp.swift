//
//  BindingBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 05.11.2022.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var bgColor: Color = .green
    @State var title: String = "Title"
    
    var body: some View {
        ZStack{
            bgColor
                .ignoresSafeArea(.all)
            
            VStack{
                Text(title)
                    .foregroundColor(.white)
                ButtonView(bgColor: $bgColor, titleTxt: $title)
            }
            
        }
    }
}

struct BindingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BindingBootcamp()
    }
}

struct ButtonView: View {
    @Binding var bgColor : Color
    @Binding var titleTxt : String
    @State var btnColor : Color = .blue
    
    var body: some View {
        Button {
            if bgColor == .orange {
                bgColor = .green
                btnColor = .blue
                titleTxt = "Title"
            }else{
                bgColor = .orange
                btnColor = .pink
                titleTxt = "New title"
            }
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(btnColor)
                .cornerRadius(10)
        }
    }
}
