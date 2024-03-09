//
//  SettingsEditImageView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/13/24.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct SettingsEditImageView: View {

    @State var title: String
    @State var description: String
    @State var selectedImage: UIImage // Image shown on this screen
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        VStack {
            HStack {
                Text(description)
                Spacer(minLength: 0)
            }
            
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200, alignment: .center)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                Text("Import".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.yellowColor)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .tint(Color.MyTheme.purpleColor)
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
            
            Button(action: {
                
            }, label: {
                Text("Save".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            })
            .tint(Color.MyTheme.yellowColor)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle(title)
        
    }
}

#Preview {
    NavigationStack {
        SettingsEditImageView(title: "title", description: "Description", selectedImage: UIImage(named: "dog1")!)
    }
}
