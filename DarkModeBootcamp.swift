//
//  DarkModeBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/4/22.
//

import SwiftUI

struct DarkModeBootcamp: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 20){
                    Text("This color is PRIMARY")
                        .foregroundColor(.primary)
                    
                    Text("This color is SECONDARY")
                    
                    Text("This color is locally adaptive")
                        .foregroundColor(colorScheme == .dark ? .yellow : .red)
                }
            }.navigationTitle("Dark Mode Bootcamp")
        }
    }
}

struct DarkModeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DarkModeBootcamp()
    }
}
