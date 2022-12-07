//
//  IfLetGuardBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/6/22.
//

import SwiftUI

struct IfLetGuardBootcamp: View {
    // MARK: PROPERTIES
    @State var currentUserId: String? = "testuser"
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    
    
    // MARK: BODY
    var body: some View {
        NavigationView {
            VStack{
                Text("Here we are practicing safe coding.")
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }

//                Text(displayText ?? "Error")
//                    .font(.title)
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            .navigationTitle("Safe coding")
            .onAppear{
                loadData2()
            }
        }
    }
    
    // MARK: FUNCTIONS
    
    func loadData() {
        if let userId = currentUserId {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                displayText = "This is the new data. User ID is: \(userId)"
                isLoading = false
            }
        } else {
            displayText = "Error. There is no User ID"
        }
    }
    
    func loadData2() {
        guard let userID = currentUserId else {
            displayText = "Error. There is no User ID"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            displayText = "This is the new data. User ID is: \(userID)"
            isLoading = false
        }
    }
}

// MARK: PREVIEW

struct IfLetGuardBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuardBootcamp()
    }
}
