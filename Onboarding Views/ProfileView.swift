//
//  ProfileView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/9/22.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var signedIn: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text(currentUserName ?? "Your name")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("\(currentUserAge ?? 0) years old")
                    .font(.caption)
                Text(currentUserGender ?? "Unknown")
                    .font(.caption)
            }
            .foregroundColor(.white)
            .padding(40)
            .background(Color(#colorLiteral(red: 0.8, green: 0.1928538442, blue: 0, alpha: 1)))
            .cornerRadius(25)
            .shadow(radius: 10)
            
            
            Spacer()
            Spacer()
            Text("Sign out")
                .padding()
                .padding(.horizontal, 60)
                .background(Color.black)
                .foregroundColor(.white)
                .bold()
                .cornerRadius(10)
                .onTapGesture {
                    signOut()
                }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange.ignoresSafeArea())
    }
    
    func signOut(){
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        
        withAnimation(.spring())
        {
            signedIn = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
