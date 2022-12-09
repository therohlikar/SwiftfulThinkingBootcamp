//
//  AppStorageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/9/22.
//

import SwiftUI

struct AppStorageBootcamp: View {
    // MARK: PROPERTIES
    @AppStorage("username") var currentUserName: String?
    
    
    //MARK: BODY
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea()
            
            VStack(spacing: 20){
                HStack{
                    
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                        
                        Image(systemName: "person.fill")
                            .foregroundColor(.orange)
                            .font(.title)
                    }
                    
                    
                    Text(currentUserName ?? "Unknown")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }

                Button {
                    let name = "rozko"
                    currentUserName = name
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .bold()
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .foregroundColor(.orange)
                        .cornerRadius(30)
                        
                }

            }
        }
        
    }
}


//MARK: PREVIEW
struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
