//
//  ContentView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var currentUserID: String? = "user"
    
    var body: some View {
        TabView {
            NavigationStack {
                FeedView(posts: PostArrayObject(), title: "Feed")
            }
            .tabItem {
                Image(systemName: "book.fill")
                Text("Feed")
            }
            
            NavigationStack {
                BrowseView()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Browse")
            }
            
            NavigationView {
                UploadView()
            }
            .tabItem {
                Image(systemName: "square.and.arrow.up.fill")
                Text("Upload")
            }
            
            ZStack{
                if currentUserID != nil {
                    NavigationStack {
                        ProfileView(isMyProfile: true, profileDisplayName: "My Profile", profileUserID: "")
                    }
                } else {
                    NavigationStack {
                        SignUpView()
                    }
                }
                
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
            
        }
        .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
    }
}

#Preview {
    ContentView()
}
