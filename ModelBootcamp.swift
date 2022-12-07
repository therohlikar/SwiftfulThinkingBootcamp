//
//  ModelBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/7/22.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
    
}

struct ModelBootcamp: View {
    @State var users: [UserModel] = [
        //"Nick", "Emily", "Samantha", "Chris"
        UserModel(displayName: "Nick", userName: "mynamenick", followerCount: 15, isVerified: false),
        UserModel(displayName: "Emily", userName: "chickenlife", followerCount: 20, isVerified: true),
        UserModel(displayName: "Samantha", userName: "whoisthis20", followerCount: 4500, isVerified: true),
        UserModel(displayName: "Chris", userName: "chris.wollick", followerCount: 488875, isVerified: true)
    ]
    
    //@State var showSheet: Bool = false
    
    var body: some View {
        NavigationView {
            List{
                ForEach(users) { user in
                    HStack(spacing: 15) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading){
                            Text(user.displayName)
//                                .onTapGesture {
//                                    showSheet.toggle()
//                                }
//                                .sheet(isPresented: $showSheet) {
//                                    Text("User: \(user.userName)")
//                                    Text("Display name: \(user.displayName)")
//                                    Text("Current follower count: \(user.followerCount)")
//                                }
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        VStack{
                            Text("\(user.followerCount)")
                                .font(.footnote)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                    }
                    .padding(.vertical, 10)
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Users")
        }
    }
}

struct ModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ModelBootcamp()
    }
}
