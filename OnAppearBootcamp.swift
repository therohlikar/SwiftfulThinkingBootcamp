//
//  OnAppearBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/6/22.
//

import SwiftUI

struct OnAppearBootcamp: View {
    
    @State var count: Int = 0
    @State var myText: String = "Start text."
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack{
                    ForEach(0..<50){ _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear{
                                count += 1
                            }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                    myText = "Appeared"
                }
                
            }
            .onDisappear{
                myText = "Ending text"
            }
            .navigationTitle("On Appear: \(count)")
        
        }
    }
}

struct OnAppearBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearBootcamp()
    }
}
