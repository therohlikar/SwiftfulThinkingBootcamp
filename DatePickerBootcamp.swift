//
//  DatePickerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/1/22.
//

import SwiftUI

struct DatePickerBootcamp: View {
    @State var datevalue: Date = Date() // ==> current date
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        
        formatter.dateStyle = .short
        formatter.timeStyle = .full
        
        return formatter
    }
    
    var body: some View {
        VStack{
            
            Text("SELECTED DATE IS:")
            //Text(datevalue.formatted(date: .long, time: .shortened))
            Text(dateFormatter.string(from: datevalue))
            
            
            DatePicker("", selection: $datevalue, in: startingDate...endingDate, displayedComponents: [.date])
                .datePickerStyle(.compact)
                .tint(.red)
        }
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}
