//
//  AlertsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 11/29/22.
//

import SwiftUI

struct AlertsBootcamp: View {
    
    @State var bgColor: Color = .white
    @State var showAlert: Bool = false
    
    enum MyAlerts {
        case success
        case error
    }
    
    var body: some View {
        ZStack{
            bgColor.edgesIgnoringSafeArea(.all)
            
            Button("Click here") {
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert) {
                getAlert(title: "There was an error 😅", message: "Herro", type: .error)
            }
        }
    }
    
    func getAlert(title: String, message: String, type: MyAlerts?) -> Alert {
        
        var newBgColor: Color = .white
        
        switch type {
            case .success:
                newBgColor = .yellow
            case .error:
                newBgColor = .red
            default:
                newBgColor = bgColor
        }
        
        return Alert(
            title: Text(title),
            message: Text(message),
            primaryButton: .destructive(Text("DELETE"), action: {
                bgColor = newBgColor
            }),
            secondaryButton: .cancel()
        )
    }
}

struct AlertsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertsBootcamp()
    }
}
