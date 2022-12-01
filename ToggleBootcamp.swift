//
//  ToggleBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/1/22.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State var changed: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Status:")
                    .bold()
                Text(changed ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle("Change Status", isOn: $changed)
                .padding()
                .toggleStyle(.switch)
                .tint(.purple)
            
            if changed {
                Text("Welcome on the server, dick.")
            }
            
            Spacer()
        }.padding()
    }
}

struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}
