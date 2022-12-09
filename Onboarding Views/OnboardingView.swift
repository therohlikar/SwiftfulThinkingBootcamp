//
//  OnboardingView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/9/22.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: PROPERTIES
    // Onboarding states:
    /*
     0 - Welcome screen
     1 - Add their name
     2 - Add their age
     3 - Add their gender
     */
    @State var onboardingState: Int = 0
    let signPageTransition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    //onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = "Male"
    
    //for alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    //for appstorage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var signedIn: Bool = false
    
    // MARK: BODY
    var body: some View {
        ZStack{
            Color.orange.ignoresSafeArea()
            
            // content
            ZStack{
                switch onboardingState{
                    case 0:
                        welcomeSection
                            .transition(signPageTransition)
                    case 1:
                        addNameSection
                            .transition(signPageTransition)
                    case 2:
                        addAgeSection
                            .transition(signPageTransition)
                    case 3:
                        addGenderSection
                            .transition(signPageTransition)
                    default:
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.green)
                }
            }
            // buttons
            VStack{
                Spacer()
                btnSignIn
            }
            .padding(30)
        }
        .alert(isPresented: $showAlert){
            return Alert(title: Text(alertTitle))
        }
    }
}

// MARK: PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

//MARK: COMPONENTS
extension OnboardingView{
    private var btnSignIn: some View {
        Text(onboardingState == 0 ? "Sign up" :
             onboardingState == 3 ? "Finish" : "Next")
            .font(.headline)
            .foregroundColor(.orange)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                handleNextStep()
            }
    }
    
    private var welcomeSection: some View{
        VStack(spacing: 40){
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("Find your match!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                }
            
            Text("This is the number one app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI Technquies")
                .fontWeight(.medium)
            
            Spacer()
            Spacer()
        }.foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(40)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 40){
            Spacer()

            Text("What's your name?")
                .font(.title)
                .fontWeight(.semibold)
            
            TextField("Your name here...", text: $name)
                .padding()
                .font(.title2)
                .fontWeight(.semibold)
                .background(.white)
                .foregroundColor(.black)
                .tint(.orange)
                .cornerRadius(10)
            
            Spacer()
            Spacer()
        }.foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(40)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 40){
            Spacer()

            Text("What's your age?")
                .font(.title)
                .fontWeight(.semibold)
        
            Text("\(String(format: "%.0f", age)) years old")
                .font(.largeTitle)
                .fontWeight(.semibold)
                
            
            Slider(value: $age, in: 18...100, step: 1)
                .tint(.white)
            
            Spacer()
            Spacer()
        }.foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(40)
        
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 40){
            Spacer()
            
            Text("What's your gender?")
                .font(.title)
                .fontWeight(.semibold)
            
            Picker(selection: $gender) {
                Text("Male")
                    .tag("Male")
                Text("Female")
                    .tag("Female")
                Text("Other")
                    .tag("Other")
            } label: {
                Text(gender.count > 1 ? gender : "Select your gender..")
            }
            .pickerStyle(.menu)
            .tint(.orange)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            

            Spacer()
            Spacer()
        }.foregroundColor(.white)
            .multilineTextAlignment(.center)
        .padding(40)
    }
}

// MARK: FUNCTIONS
extension OnboardingView{
    func handleNextStep(){
        // check validity
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters. 🤨")
                return
            }
            break
        case 3:
            guard gender.count >= 1 else {
                showAlert(title: "Choose your gender! 🤨")
                return
            }
            break
        default:
            break
        }
        
        // next page
        if onboardingState == 3 {
            // sign in
            signIn()
        }else {
            withAnimation(.spring()){
                onboardingState += 1
            }
        }
    }
    
    func signIn(){
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()){
            signedIn = true
        }
        
    }
    
    func showAlert(title: String){
        alertTitle = title
        showAlert.toggle()
    }
}
