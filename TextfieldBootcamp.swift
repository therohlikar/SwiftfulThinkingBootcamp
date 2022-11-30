//
//  TextfieldBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 11/30/22.
//

import SwiftUI

struct TextfieldBootcamp: View {
    @State var tfTextToSave: String = ""
    @State var errorMessage: String = ""
    @State var dataArray: [String] = []
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Type something here...", text: $tfTextToSave)
                    .padding()
                    .background(Color.gray.opacity(0.2).cornerRadius(10))
                    .font(.headline)

                Button {
                    saveText(tfTextToSave)
                } label: {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }//.disabled(!textIsAppropriate(tfTextToSave))
                
                Text(errorMessage)
                    .foregroundColor(.red)
                    .background(Color.white)
                    .font(.caption)
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("TextField Bootcamp!")
        }
    }
    
    func textIsAppropriate(_ input:String) -> Bool{
        // check text
        if input.count < 3 {
            errorMessage = "Input is not long enough (at least 3 characters)"
            return false
        }
        
        return true
    }
    
    func saveText(_ newInput: String){
        if !textIsAppropriate(newInput){
            return
        }
        
        dataArray.append(newInput)
        tfTextToSave = ""
        errorMessage = ""
    }
}

struct TextfieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldBootcamp()
    }
}
