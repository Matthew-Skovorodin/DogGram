//
//  OnboardingView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/13/24.
//

import SwiftUI
import AuthenticationServices


struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showOnboardingPart2: Bool = false
    @State private var errorTitle: String? = nil
    @State private var showError: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(radius: 12)
            
            Text("Welcome to DogGram!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.MyTheme.purpleColor)
            
            Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are a dog-loving community and we're happy to have you!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.MyTheme.purpleColor)
                .padding()
            
            Button(action: {
                showOnboardingPart2.toggle()
            }, label: {
                SignInWithAppleButton(.signUp, onRequest: configure, onCompletion: handle)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
            })
            
            Button(action: {
                showOnboardingPart2.toggle()
            }, label: {
                HStack {
                    Image("Google") // replace with google image
                    Text("Sign in with Google")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Color(.sRGB, red: 222/255, green: 82/255, blue: 70/255, opacity: 1.0))
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .font(.system(size: 20, weight: .medium, design: .default))
                            
            })
            .tint(Color.white)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Continue as guest".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
            }
            .tint(.black)

            
            
        }
        .padding(.all, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .ignoresSafeArea(.all)
        .fullScreenCover(isPresented: $showOnboardingPart2, content: {
            OnboardingViewPart2()
        })
        .alert(errorTitle ?? "Error", isPresented: $showError) {
            Button("OK") {
                
            }
            
        }
    }
    
    //MARK: - FUNCTIONS
    func configure(_ request: ASAuthorizationAppleIDRequest) {
        
    }
    
    func handle(_ authResult: Result<ASAuthorization, Error>) {
        
    }
}

#Preview {
    OnboardingView()
}
