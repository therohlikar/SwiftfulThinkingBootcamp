//
//  FocusStateBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/12/22.
//

import SwiftUI

struct FocusStateBootcamp: View {
    @State private var username: String = ""
//    @FocusState private var usernameInFocus: Bool
    
    @State private var password: String = ""
//    @FocusState private var passwordInFocus: Bool
    @FocusState private var fieldInFocus: OnboardingFields?
    
    enum OnboardingFields:Hashable {
        case username
        case password
    }
    
    var body: some View {
        VStack(spacing: 20){
            TextField("Add your name here...", text: $username)
//                .focused($usernameInFocus)
                .focused($fieldInFocus, equals: .username)
                .padding()
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(30)
            
            SecureField("Add your password here...", text: $password)
//                .focused($passwordInFocus)
                .focused($fieldInFocus, equals: .password)
                .padding()
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(30)
                
                
            
            Button("SIGN UP"){
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if usernameIsValid && passwordIsValid {
                    print("SIGN UP")
                }else if usernameIsValid {
                    fieldInFocus = .password
                }else {
                    fieldInFocus = .username
                }
            }
        }
        .padding(40)
    }
}

struct FocusStateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateBootcamp()
    }
}
