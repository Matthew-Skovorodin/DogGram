//
//  AuthenticationManager.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/18/24.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    
    static let shared = AuthenticationManager() // will be the only instance of this class in the whole app
    private init() { // use dependency injection instead for larger production app
        
    
    }
    
    func createUser() {
        Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>)
          // ...
        }
    }
}
