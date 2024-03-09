//
//  MessageView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/10/24.
//

import SwiftUI

struct MessageView: View {
    
    @State var comment: CommentModel
    
    var body: some View {
        HStack {
            
            //MARK: - PROFILE IMAGE
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
            
            
            VStack(alignment: .leading, spacing: 4, content: {
                
                //MARK: - CONTENT
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(comment.content)
                    .padding(.all, 10)
                    .foregroundColor(.primary)
                    .background(Color.gray)
                    .cornerRadius(10)
                
            })
            
            Spacer(minLength: 0)
        }
    }
}

var comment: CommentModel = CommentModel(commentID: "", userID: "", username: "Joe Green", content: "This photo is really cool. haha", dateCreated: Date())

#Preview {
    MessageView(comment: comment)
        .previewLayout(.sizeThatFits)
}
