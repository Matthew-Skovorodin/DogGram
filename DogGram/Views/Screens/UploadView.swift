//
//  UploadView.swift
//  DogGram
//
//  Created by Matthew Skovorodin on 1/11/24.
//
import SwiftUI
import PhotosUI
import UIKit

struct UploadView: View {
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var showImagePicker: Bool = false
    @State private var imageSelected: UIImage = UIImage(named: "logo")!
    @Environment(\.colorScheme) var colorScheme
    
    @State var showPostImageView: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                PhotosPicker(selection: $photosPickerItem, matching: .images) {
                    Text("Import Photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.MyTheme.yellowColor)
                }
                .tint(colorScheme == .light ? Color.MyTheme.purpleColor : Color.MyTheme.yellowColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.MyTheme.purpleColor)
                
                Button(action: {
                    showImagePicker.toggle()
                }, label: {
                    Text("Take Photo".uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.MyTheme.purpleColor)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.MyTheme.yellowColor)
            }
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(radius: 9)
                .onChange(of: photosPickerItem) { _, _ in
                    Task {
                        if let photosPickerItem,
                           let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                            if let image = UIImage(data: data) {
                                imageSelected = image
                            }
                            showPostImageView.toggle()
                        }
                    }
                }
                .fullScreenCover(isPresented: $showPostImageView, content: {
                    PostImageView(imageSelected: $imageSelected)
                })
        }
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 0) {
                Color.clear
                    .frame(height: 0)
                    .background(Material.bar)
            }
            .ignoresSafeArea(.all, edges: .top)
        .sheet(isPresented: $showImagePicker, content: {
            ImagePicker(imageSelected: $imageSelected)
        })
    }
    
}


#Preview {
    UploadView()
}
