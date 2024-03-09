//
//  SettingsView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/12/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                //MARK: - SECTION 1: DOGGRAM
                GroupBox(label: SettingsLabelView(labelText: "DogGram", labelImage: "dot.radiowaves.left.and.right"), content: {
                    HStack(alignment: .center, spacing: 10, content: {
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are a dog-loving community and we're happy to have you!")
                            .font(.footnote)
                        
                    })
                })
                .padding()
                
                //MARK: - SECTION 2: PROFILE
                
                GroupBox(label: SettingsLabelView(labelText: "Profile", labelImage: "person.fill"), content: {
    
                    NavigationLink {
                        SettingsEditTextView(submissionText: "Current display name", title: "Display name", description: "You can edit your display name here. This will be seen by other users on your profile and on your posts.", placeholder: "Your display name here...")
                    } label: {
                        SettingsRowView(leftIcon: "pencil", text: "Display name", color: Color.MyTheme.purpleColor)
                            .tint(.primary)
                    }

                    NavigationLink {
                        SettingsEditTextView(submissionText: "Current bio here", title: "Profile Bio", description: "Your bio is a great place to let other users know a little about you, it will be shown on your profile only", placeholder: "Your bio here...")
                    } label: {
                        SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.purpleColor)
                            .tint(.primary)
                    }

                    NavigationLink {
                        SettingsEditImageView(title: "Profile Picture", description: "Your profile picture will be shown on your profile and your posts. Most users make it an image of themselves or of their dog!", selectedImage: UIImage(named: "dog1")!)
                    } label: {
                        SettingsRowView(leftIcon: "photo", text: "Profile picture", color: Color.MyTheme.purpleColor)
                            .tint(.primary)
                    }

                    
                    SettingsRowView(leftIcon: "figure.walk", text: "Sign out", color: Color.MyTheme.purpleColor)
                })
                .padding()
                
                //MARK: - SECTION 3: APPLICATION
                
                GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                    
                    Button {
                        openCustomURL(urlString: "https://www.google.com")
                    } label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.yellowColor)
                            .tint(.primary)
                    }
                    
                    Button {
                        openCustomURL(urlString: "https://www.yahoo.com")
                    } label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.yellowColor)
                            .tint(.primary)
                    }

                    Button {
                        openCustomURL(urlString: "https://www.Bing.com")
                    } label: {
                        SettingsRowView(leftIcon: "globe", text: "DogGram's website", color: Color.MyTheme.yellowColor)
                            .tint(.primary)
                    }
                })
                .padding()
                
                //MARK: - SECTION 4: SIGN OFF
                GroupBox(content: {
                    Text("DogGram was made with love. \n All Rights Reserved \n Cool Apps Inc. \n Copyright 2020 ❤️")
                        .foregroundStyle(Color.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                })
                .padding()
                .padding(.bottom, 80)
                
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                    }
                    .tint(.primary)
                }
            }
        }
        .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
    }
    
    //MARK: - FUNCTIONS
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    SettingsView()
}