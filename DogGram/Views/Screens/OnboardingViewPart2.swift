//
//  OnboardingViewPart2.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/13/24.
//

import SwiftUI
import PhotosUI

struct OnboardingViewPart2: View {
    
    @State var displayName: String = "l"
    @State var selectedImage: UIImage = UIImage(named: "logo")!// Image shown on this screen
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            
            Text("What's your name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.MyTheme.yellowColor)
            
            TextField("Add your name here...", text: $displayName)
                .padding()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.MyTheme.beigeColor)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .font(.headline)
                .textInputAutocapitalization(.sentences)
                .padding()
            
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                Text("Finish: Add profile picture")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
            }
            .tint(Color.MyTheme.purpleColor)
            .opacity(displayName != "" ? 1.0 : 0.0)
            .animation(.easeOut, value: 1.0)
        
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.purpleColor)
        .ignoresSafeArea(.all)
        .onChange(of: photosPickerItem) { _, _ in
            Task {
                if let photosPickerItem,
                   let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        selectedImage = image
                    }
                }
            }
        }
    }
    
    //MARK: - FUNCTIONS
    
    func createProfile() {
        print("CREATE PROFILE")
    }
}

#Preview {
    OnboardingViewPart2()
}
