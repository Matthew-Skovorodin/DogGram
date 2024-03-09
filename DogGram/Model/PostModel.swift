//
//  PostModel.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/10/24.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable { // Identifiable means every post model item has its own unique ID,
    var id = UUID()
    var postID: String // ID for the post in database
    var userID: String // ID for the user in database
    var username: String
    var caption: String?
    var dateCreated: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id) 
    }

    
}
