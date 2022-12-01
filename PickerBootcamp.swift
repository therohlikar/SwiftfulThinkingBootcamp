//
//  PickerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/1/22.
//

import SwiftUI

struct PickerBootcamp: View {
    @State var selection: String = "Most Recent"
    let filterOptions: [String] = [
        "Most Recent", "Most Popular", "Most Liked"
    ]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.orange
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        Picker(selection: $selection) {
            ForEach(filterOptions, id: \.self) { filter in
                Text(filter).tag(filter)
            }
        } label: {
            VStack {
                Text("Filter")
                Text(selection)
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
        }
        .pickerStyle(.segmented)
        
        
        //        VStack{
        //            HStack{
        //                Text("Age:")
        //                Text(selection)
        //            }
        //
        //            Picker(selection: $selection) {
        //                ForEach(18..<100){ number in
        //                    Text("\(number)")
        //                        .tag("\(number)")
        //                }
        //
        //            } label: {
        //                Text("Picker")
        //            }
        //            .pickerStyle(.menu)
        //
        //        }
        //    }
    }
        
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
