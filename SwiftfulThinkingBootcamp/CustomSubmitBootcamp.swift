//
//  CustomSubmitBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/12/22.
//

import SwiftUI

struct CustomSubmitBootcamp: View {
    @State private var text:String = ""
    
    var body: some View {
        TextField("Placeholder", text: $text)
            .onSubmit {
                print("whatever")
            }
            .submitLabel(.send)
            .tint(.red)
    }
}

struct CustomSubmitBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomSubmitBootcamp()
    }
}
