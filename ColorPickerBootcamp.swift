//
//  ColorPickerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/1/22.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    @State var raceColor: Color = .white
    @State var oky: Int = 0
    
    var body: some View {
        VStack{
            ColorPicker("Choose your race", selection: $raceColor, supportsOpacity: true)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.headline)
                .padding(50)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(raceColor.ignoresSafeArea(.all))
        
        
    }
}

struct ColorPickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBootcamp()
    }
}
