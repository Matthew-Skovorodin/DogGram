//
//  FeedView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/9/24.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var posts: PostArrayObject // by creating this object we can change up the init however we want, ex: group by date, randomly, etc
    var title: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(posts.dataArray, id: \.self) { post in
                    PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
                }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    NavigationView {
        FeedView(posts: PostArrayObject(), title: "Feed Test")
    }
}
