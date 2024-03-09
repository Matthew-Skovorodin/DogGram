//
//  SignInEmailView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/18/24.
//

import SwiftUI

@MainActor
final class SignInWithEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
}

struct SignInEmailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var viewModel = SignInWithEmailViewModel()
    var body: some View {
//        VStack {
//            TextField("Email...", text: $viewModel.email)
//                .padding()
//                .background(Color.gray.opacity(0.4))
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//        }
//        .navigationTitle("Sign In With Email")
        VStack {
          Image("Login")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(minHeight: 300, maxHeight: 400)
          Text("Login")
            .font(.largeTitle)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)

          HStack {
            Image(systemName: "at")
            TextField("Email", text: $viewModel.email)
              .textInputAutocapitalization(.never)
              .disableAutocorrection(true)
//              .focused($focus, equals: .email)
              .submitLabel(.next)
//              .onSubmit {
//                self.focus = .password
//              }
          }
          .padding(.vertical, 6)
          .background(Divider(), alignment: .bottom)
          .padding(.bottom, 4)

          HStack {
            Image(systemName: "lock")
            SecureField("Password", text: $viewModel.password)
//              .focused($focus, equals: .password)
              .submitLabel(.go)
//              .onSubmit {
//                signInWithEmailPassword()
//              }
          }
          .padding(.vertical, 6)
          .background(Divider(), alignment: .bottom)
          .padding(.bottom, 8)

//          if !viewModel.errorMessage.isEmpty {
//            VStack {
//              Text(viewModel.errorMessage)
//                .foregroundColor(Color(UIColor.systemRed))
//            }
//          }

          Button(action: {}) {
            if true {
              Text("Login")
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
            }
            else {
              ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
            }
          }
//          .disabled(!viewModel.isValid)
          .frame(maxWidth: .infinity)
          .buttonStyle(.borderedProminent)

          HStack {
            VStack { Divider() }
            Text("or")
            VStack { Divider() }
          }

          Button(action: {}) {
            Text("Sign in with Google")
              .padding(.vertical, 8)
              .frame(maxWidth: .infinity)
              .background(alignment: .leading) {
                Image("Google")
                  .frame(width: 30, alignment: .center)
              }
          }
          .foregroundColor(colorScheme == .dark ? .white : .black)
          .buttonStyle(.bordered)

          HStack {
            Text("Don't have an account yet?")
            Button(action: {}) {
              Text("Sign up")
                .fontWeight(.semibold)
                .foregroundColor(.blue)
            }
          }
          .padding([.top, .bottom], 50)

        }
        .listStyle(.plain)
        .padding()
//        .analyticsScreen(name: "\(Self.self)")
      }
    }

#Preview {
    SignInEmailView()
}
