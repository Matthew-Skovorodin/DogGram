//
//  ComentModel.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/10/24.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
    
    var id = UUID()
    var commentID: String // ID from the comment in database
    var userID: String // ID for user in database
    var username: String // Username for the user in the database
    var content: String
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
