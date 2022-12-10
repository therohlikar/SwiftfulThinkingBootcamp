//
//  AsyncImageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/10/22.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    let url = URL(string: "https://picsum.photos/300")
    let errorurl = URL(string: "mojepic.png")
    
    var body: some View{
        ZStack{
            Color.gray.opacity(0.2).ignoresSafeArea()
            
            
            TabView {
                AsyncImage(url: url) { img in
                    img
                        .cornerRadius(25)
                        .shadow(radius: 15, x: -25, y: 25)
                } placeholder: {
                    ProgressView()
                }
                
                AsyncImage(url: url) { img in
                    img
                        .cornerRadius(25)
                        .shadow(radius: 15, x: -25, y: 25)
                } placeholder: {
                    ProgressView()
                }
                
                AsyncImage(url: errorurl) { phase in
                    switch phase{
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .cornerRadius(25)
                            .shadow(radius: 15, x: -25, y: 25)
                    case .failure:
                        Image(systemName: "questionmark")
                            .font(.headline)
                    default:
                        Image(systemName: "questionmark")
                            .font(.headline)
                    }
                    

                }
            }
            .tabViewStyle(.page)
        }
    }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}
