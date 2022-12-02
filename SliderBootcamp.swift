//
//  SliderBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/2/22.
//

import SwiftUI

struct SliderBootcamp: View {
    @State var sliderValue: Double = 3
    @State var color: Color = .red
    
    var body: some View {
        VStack{
            Text("Rating: ")
            Text(
                String(format: "%.0f", sliderValue)
                //"\(sliderValue)"
            )
            
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: { _ in
                    if sliderValue > 3 {
                        color = .purple
                    }else {
                        color = .red
                    }
                },
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("2"),
                label: {
                    Text("Title")
                }
                )
                .padding()
                .tint(.black)
                
            Spacer()
        }
        .background(color.ignoresSafeArea(.all))
        
    }
}

struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}
