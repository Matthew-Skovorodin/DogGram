//
//  ImageGridView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/11/24.
//

import SwiftUI

struct ImageGridView: View {
    
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ],
        alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
        spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/,
        pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/,
        content: {
            ForEach(posts.dataArray, id: \.self) { post in
                
                NavigationLink(
                    destination: FeedView(posts: PostArrayObject(post: post), title: "Post"),
                    label: {
                        PostView(post: post, showHeaderAndFooter: false, addHeartAnimationToView: false)
                    })
            }
        })
    }
}

#Preview {
    ImageGridView(posts: PostArrayObject())
        .previewLayout(.sizeThatFits)
}
