//
//  ProfileView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/12/24.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var isMyProfile: Bool
    @State var profileDisplayName: String
    var profileUserID: String
    
    var posts = PostArrayObject()
    
    @State var showSettings: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            Divider()
            ImageGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isMyProfile {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showSettings.toggle()
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                    })
                    .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
                }
            }
        }
        .sheet(isPresented: $showSettings, content: {
            SettingsView()
        })
    }
}

#Preview {
    NavigationStack {
        ProfileView(isMyProfile: true, profileDisplayName: "Joe", profileUserID: "")
    }
}
