//
//  IntroView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/9/22.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var signedIn: Bool = false
    
    var body: some View {
        ZStack{
            //background
            RadialGradient(colors: [Color(#colorLiteral(red: 0.9883652329, green: 0.6750738025, blue: 0.2520774901, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5534484386, blue: 0, alpha: 1))], center: .topLeading, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            if signedIn {
                ProfileView()
            }else {
                OnboardingView()
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
