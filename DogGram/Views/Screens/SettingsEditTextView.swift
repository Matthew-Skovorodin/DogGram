//
//  SettingsEditTextView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/12/24.
//

import SwiftUI

struct SettingsEditTextView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    
    var body: some View {
        VStack {
            HStack {
                Text(description)
                Spacer(minLength: 0)
            }
            
            TextField(placeholder, text: $submissionText)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(colorScheme == .light ? Color.MyTheme.beigeColor : Color.MyTheme.purpleColor)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .font(.headline)
                .textInputAutocapitalization(.sentences)
            
            Button(action: {
                
            }, label: {
                Text("Save".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            })
            .tint(colorScheme == .light ? Color.MyTheme.yellowColor : Color.MyTheme.purpleColor)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
    }
}

#Preview {
    NavigationStack {
        SettingsEditTextView(title: "Test Title", description: "This is a description", placeholder: "Test Placeholder")
    }
    
}
  
      



