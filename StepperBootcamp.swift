//
//  StepperBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/1/22.
//

import SwiftUI

struct StepperBootcamp: View {
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack{
            Stepper("Current: \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Current: \(stepperValue)") {
                //increment
                incrementWidth(100)
            } onDecrement: {
                //decrement
                decrementWidth(50)
            }

        }
    }
    
    func incrementWidth(_ amount: CGFloat){
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
        
    }
    
    func decrementWidth(_ amount: CGFloat){
        withAnimation(.easeInOut) {
            widthIncrement -= amount
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
