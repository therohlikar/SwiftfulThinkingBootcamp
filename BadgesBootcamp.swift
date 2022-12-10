//
//  BadgesBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/10/22.
//

import SwiftUI


// only lists and tabviews

struct BadgesBootcamp: View {
    
    
    
    var body: some View {
        List{
            Text("Hello world")
                .badge(1)
            Text("Hello world")
                .badge(500)
            Text("Hello world")
                .badge("NEW")
            Text("Hello world")
        }
        
        TabView{
            Color.red
                .tabItem{
                    Image(systemName: "heart.fill")
                    Text("Liked")
                }
                .badge("NEW")
            
            Color.green
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
            Color.blue
                .tabItem{
                    Image(systemName: "archivebox.fill")
                    Text("Archived")
                }
                .badge(500)
        }
    }
}

struct BadgesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgesBootcamp()
    }
}
