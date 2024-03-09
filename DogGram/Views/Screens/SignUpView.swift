//
//  SignUpView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/13/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State var showOnboarding: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Spacer()
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
            
            Text("You are not signed in! ☹️")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundStyle(Color.MyTheme.purpleColor)
            
            Text("Click the button below to create an account and join the fun!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.MyTheme.purpleColor)
            
            Button(action: {
                showOnboarding.toggle()
                
            }, label: {
                Text("Sign in / Sign up")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.MyTheme.purpleColor)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 12)
            })
            .tint(Color.MyTheme.yellowColor)
            
            Spacer()
            Spacer()
        })
        .padding(.all, 40)
        .background(Color.MyTheme.yellowColor)
        .ignoresSafeArea(.all)
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                Color.clear
                    .frame(height: 0)
                    .background(Material.bar)
            }
            .ignoresSafeArea(.all, edges: .top)
        .fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingView()
        })
    }
}

#Preview {
    SignUpView()
}
