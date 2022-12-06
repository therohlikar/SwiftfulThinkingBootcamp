//
//  DocumentationBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/5/22.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    // MARK: PROPERTIES
    
    @State var data: [String] = [
        "apples", "oranges", "bananas"
    ]
    @State var showAlert: Bool = false
    
    // MARK: BODY
    
    
    // RJ - Working copy - things to do:
    /*
     1) Fix title
     2) Fix alert
     3) Fix your life, dumbass
    */
    
    var body: some View {
        NavigationView { // START: NAV
            ZStack {
                // background
                Color.red.ignoresSafeArea()
                
                // foreground
                foregroundLayer
                .navigationTitle("Documentation")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAlert.toggle()
                        } label: {
                            Text("ALERT")
                        }

                    }
                }
                .alert(isPresented: $showAlert) {
                    getAlert(text: "An alert.")
                }
            }
            
        } // END: NAV
    }
    
    
    /// This is the foreground layer that holds a scrollView.
    private var foregroundLayer: some View{
        ScrollView{ // START: SCROLLV
            Text("Hello")
            
            ForEach(data, id: \.self) { name in
                Text(name.capitalized)
                    .font(.headline)
            }
        } // END: SCROLLV
    }
    
    // MARK: FUNCTIONS
    
    /// Gets an alert with a specified title.
    ///
    /// This function creates and returns an alert immediately. The alert will have a title based on the text parameter, but it will NOT have a message.
    /// ```
    /// getAlert(text: "Hi") -> Alert(title: Text("Hi"))
    /// ```
    ///
    /// - Warning: There is no additional message in this Alert.
    /// - Parameter text: The title for the alert.
    /// - Returns: Returns an alert with a title.
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

//MARK: PREVIEW

struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
