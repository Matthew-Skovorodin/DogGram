//
//  PostView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/10/24.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
    @State var postImage: UIImage = UIImage(named:"dog1")!
    
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView: Bool
    @State var showActionSheet: Bool = false
    @State var actionSheetType: PostActionSheetOption = .general
    
    enum PostActionSheetOption {
        case general
        case reporting
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            
            //MARK: - HEADER
            if showHeaderAndFooter {
                HStack {
                    
                    NavigationLink {
                        ProfileView(isMyProfile: false, profileDisplayName: post.username, profileUserID: post.userID)
                    } label: {
                        Image("dog1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30, alignment: .center)
                        .clipShape(Circle())
                        
                        Text(post.username)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary) // color changes based on dark/light mode
                    }

                    Spacer()
                    Button {
                        showActionSheet.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    }
                    .tint(.primary)
                    getActionSheet()

                }
                .padding(.all, 6)
            }
            
            //MARK: - IMAGE
            ZStack {
                Image(uiImage: postImage)
                    .resizable()
                    .scaledToFit()
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
            }
            
            
            //MARK: - FOOTER
            if showHeaderAndFooter {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                    Button {
                        if post.likedByUser {
                            unlikePost()
                        }
                        else {
                            likePost()
                        }
                    } label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                            .font(.title3)
                    }
                    .tint(post.likedByUser ? .red : .primary)

                    
                    
                    //MARK: - COMMENT ICON
                    NavigationLink(
                        destination: CommentsView(),
                        label: {
                            Image(systemName: "bubble.middle.bottom")
                                .font(.title3)
                                .foregroundColor(.primary)
                        })
                    Button {
                        sharePost()
                    } label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                    }
                    .tint(.primary)

                    
                    
                    Spacer()
                })
                .padding(.all, 6)
                
                if let caption = post.caption {
                    HStack {
                        Text(caption)
                        Spacer(minLength: 0) // If the caption isnt as big as the entire screen
                    }
                    .padding(.all, 6)
                }
            }
        })
    }
    
    //MARK: - FUNCTIONS
    
    func likePost() {
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedByUser: true)
        self.post = updatedPost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            animateLike = false
        }
    }

    func unlikePost() {
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedByUser: false)
        self.post = updatedPost
    }
    
    func getActionSheet() -> some View {
        switch self.actionSheetType {
        case .general:
            return AnyView(
                Text("")
                    .confirmationDialog("What would you like to do?", isPresented: $showActionSheet, titleVisibility: .visible) {
                        Button("Report", role: .destructive) {
                            self.actionSheetType = .reporting
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.showActionSheet.toggle()
                            }
                        }
                        Button("Learn more...") {
                            print("LEARN MORE PRESSED")
                        }
                        Button("Cancel", role: .cancel) {
                            // Your cancel action here
                        }
                    }
            )
        case .reporting:
            return AnyView(
                Text("")
                    .confirmationDialog("Why are you reporting this post?", isPresented: $showActionSheet, titleVisibility: .visible) {
                        Button("This is inappropriate", role: .destructive) {
                            reportPost(reason: "This is inappropriate")
                        }
                        Button("This is spam", role: .destructive) {
                            reportPost(reason: "This is spam")
                        }
                        Button("It made me uncomfortable", role: .destructive) {
                            reportPost(reason: "It made me uncomfortable")
                        }
                        Button("Cancel", role: .cancel) {
                            self.actionSheetType = .general
                        }
                    }
            )
        }
    }

    func reportPost(reason: String) {
        print("REPORT POST NOW")
    }
    
    func sharePost() { // in real implementation enable deep links to bring user back to the app
        
        let message = "Check out this post on DogGram"
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }

        guard let firstWindow = firstScene.windows.first else {
            return
        }

        let viewController = firstWindow.rootViewController
        
        let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)

        viewController?.present(activityViewController, animated: true, completion: nil)
    }
    
}


var post: PostModel = PostModel(postID: "", userID: "", username: "Joe Green", caption: "This is a test caption", dateCreated: Date(), likeCount: 0, likedByUser: false)

#Preview {
    PostView(post: post, showHeaderAndFooter: true, addHeartAnimationToView: true)
        .previewLayout(.sizeThatFits)
}
