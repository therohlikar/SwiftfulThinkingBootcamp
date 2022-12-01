//
//  TextEditorBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/1/22.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State var teBio: String = "Something ..."
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                TextEditor(text: $teBio) // .constant("MEH")
                    .frame(height: 250)
                    .cornerRadius(10)
                Button {
                    savedText = teBio
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Text(savedText)
                
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0.3))
            .navigationTitle("TextEditor Bootcamp!")
            
        }
    }
}

struct TextEditorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootcamp()
    }
}
